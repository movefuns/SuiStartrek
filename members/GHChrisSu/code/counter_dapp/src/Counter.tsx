import { useSignAndExecuteTransactionBlock, useSuiClient } from '@mysten/dapp-kit';
import { TransactionBlock } from "@mysten/sui.js/transactions";
import { COUNTER_PACKAGE_ID } from "./constants";

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
      target: `${COUNTER_PACKAGE_ID}::counter::create`,
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

import { useSuiClientQuery } from '@mysten/dapp-kit';
import { SuiObjectData } from '@mysten/sui.js/client';

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