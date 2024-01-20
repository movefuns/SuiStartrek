# counter dapp
需要用到`node npm/pnpm` 我都安装好了 直接安装项目
`pnpm create @mysten/create-dapp --template react-client-dapp`

## 运行脚手架
安装依赖`npm install` 
运行项目`npm run dev`

## 编码
创建新的`constants.tsx`文件，并且设置为本地开发的钱包地址
```tsx
export const COUNTER_PACKAGE_ID="0x9e896201458f3ea9896a89e5c957228fb62b0f2cdeb9fd79e48c1ab576b139ab"
```

修改`OwnedObjects.tsx`文件，增加显示连接的钱包的balance
```tsx
export function OwnedObjects() {
  const account = useCurrentAccount();
  const { data: gasData, isPending: isGasPending, error: gasError } = useSuiClientQuery(
    "getBalance",
    {
      owner: account?.address as string,
    },
    {
      enabled: !!account,
    },
  );
  const { data, isPending, error } = useSuiClientQuery(
    "getOwnedObjects",
    {
      owner: account?.address as string,
    },
    {
      enabled: !!account,
    },
  );
  if (!account) {
    return;
  }
  if (gasError) {
    return <Flex>Error fetching gas balance: {gasError.message}</Flex>;
  }
  if (error) {
    return <Flex>Error: {error.message}</Flex>;
  }
  if (isPending || !data || isGasPending) {
    return <Flex>Loading...</Flex>;
  }
  return (
    <Flex direction="column" my="2">
      <Heading size="4">Objects owned by the connected wallet</Heading>
      <Text>Current Gas Balance: {gasData.totalBalance}</Text>
      {data.data.length === 0 ? (
        <Text>No objects owned by the connected wallet</Text>
      ) : (
        data.data.map((object) => (
          <Flex key={object.data?.objectId}>
            <Text>Object ID: {object.data?.objectId}</Text>
          </Flex>
        ))
      )}
    </Flex>
  );
}
```

创建一个新的`Counter.tsx`，编写Counter和CreateCounter组件
```tsx
import { useSignAndExecuteTransactionBlock, useSuiClient } from '@mysten/dapp-kit';
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { COUNTER_PACKAGE_ID } from "./constants";
import { useSuiClientQuery } from '@mysten/dapp-kit';
import { SuiObjectData } from '@mysten/sui.js/client';

export function CreateCounter(props: { onCreated: (id: string) => void }) {
  //使用dAppKit中的useSuiClient钩子,获取SuiClient的实例
  const suiClient = useSuiClient();
  //在组件中调用useSignAndExecuteTransactionBlock钩子，它提供了一个可以在函数create中使用的mutate函数
  const { mutate: signAndExecute } = useSignAndExecuteTransactionBlock();
  return (
    <div>
      <button
        onClick={() => {
          console.log("CreateCounter Button click!!!")
          create();
        }}
      >
        Create Counter with Package:{COUNTER_PACKAGE_ID}
      </button>
    </div>
  );
  function create() {
    const txb = new TransactionBlock();
    txb.moveCall({
      arguments: [],
      target: `${COUNTER_PACKAGE_ID}::lib::initCounter`,
    });

    signAndExecute(
      {
        transactionBlock: txb,
        options: {
          showEffects: true,
        },
      },
      {
        onSuccess: (tx) => {
          //用waitForTransactionBlock的方法SuiClient ,
          //在create函数中使用suiClient等待索引TransactionBlock
          suiClient
            .waitForTransactionBlock({
              digest: tx.digest,
            })
            .then(() => {
              // 获取到的objectID
              const objectId = tx.effects?.created?.[0]?.reference?.objectId;
              if (objectId) {
                props.onCreated(objectId);
              }
            });
        },
        onError: (e) => {
          alert("警告！\n检查defaultNetwork和COUNTER_PACKAGE_ID");
          console.log(e);
        }
      },
    );
  }
}

export function Counter({ id }: { id: string }) {
  const suiClient = useSuiClient();
  const { mutate: signAndExecute } = useSignAndExecuteTransactionBlock();

  //当前Counter对象，使用 getObject RPC 方法从对象中提取。
  const { data, refetch } = useSuiClientQuery('getObject', {
    id,
    options: {
      showContent: true,
    },
  });
  console.log("find Object");
  console.log(data);
  // 判断是否获取到Counter
  if (!data?.data) return <div>Not found {id}</div>;
  return (
    <div>
      <div>Count: {getCounterFields(data.data)?.value}</div>
      <button onClick={() => executeMoveCall()}>Increment</button>
    </div>
  );

  function executeMoveCall() {
    const txb = new TransactionBlock();
    txb.moveCall({
      arguments: [txb.object(id)],
      target: `${COUNTER_PACKAGE_ID}::lib::incr`,
    });

    signAndExecute(
      {
        transactionBlock: txb,
      },
      {
        onSuccess: (tx) => {
          suiClient.waitForTransactionBlock({ digest: tx.digest }).then(() => {
            refetch();
          });
        },
        onError: (e) => {
          // alert("警告！\n检查defaultNetwork和COUNTER_PACKAGE_ID");
          console.log(e);
        }
      },
    );
  }
}

// 获取Counter Object中的value field
function getCounterFields(data: SuiObjectData) {
  if (data.content?.dataType !== 'moveObject') {
    return null;
  }
  return data.content.fields as { value: number };
}
```

在`App.tsx`文件中添加一个section，并导入Counter和CreateCounter组件 并设置setCounter
```tsx
  import { CreateCounter } from './Counter'
  import { Counter } from './Counter'
  const [counterId, setCounter] = useState(() => {
    const hash = window.location.hash.slice(1);
    return isValidSuiObjectId(hash) ? hash : null;
  });
    <section>
    Counter ObjectID: {counterId},
    <div>
    <input
        type="text"
        placeholder="Enter ObjectID"
        onChange={(e) => {
        console.log("text change to: "+e.target.value);
        setCounter(e.target.value)
        }}
    />
    </div>
    {
        !currentAccount ? (
        'Please connect your wallet'
        ) : counterId ? (
        <Counter id={counterId} />
        ) : (
        <div>
            <CreateCounter
            onCreated={(id) => {
                window.location.hash = id;
                setCounter(id);
                console.log("CreateCounter success，Counter ObjectID: " + id);
            }}
            />
        </div>
        )
    }
    </section>
```

