import '@radix-ui/themes/styles.css';
import { Theme, Flex, Heading, Container, Button, Select } from '@radix-ui/themes'
import { ConnectButton, useCurrentAccount, useSignAndExecuteTransactionBlock, useSuiClient, useSuiClientQuery } from '@mysten/dapp-kit';
import { useMemo, useState } from 'react';
import { PACKAGE_ID, STATE_ID } from './constants';
import { TransactionBlock } from '@mysten/sui.js/transactions';
import { NFTRender, NFTRenderBoard } from './NFTRender';

export function MintNFT(props: { onCreated: (nfts: string[]) => void }) {
  const suiClient = useSuiClient();
  const { mutate: signAndExecute } = useSignAndExecuteTransactionBlock();
  return (
    <Button
      onClick={() => {
        mint();
      }}
    >Mint GameNFT
    </Button>

  );
  function mint() {
    const txb = new TransactionBlock();
    txb.moveCall({
      arguments: [txb.object(STATE_ID)],
      target: `${PACKAGE_ID}::game::mint`,
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
          suiClient
            .waitForTransactionBlock({
              digest: tx.digest,
            })
            .then(() => {
              const objectId = tx.effects?.created?.[0]?.reference?.objectId;
              if (objectId) {
                props.onCreated([objectId]);
              }
            });
        },
        onError: (e) => {
          alert("警告！\n检查defaultNetwork和PACKAGE_ID");
          console.log(e);
        }
      },
    );
  }
}

export default function App() {
  const account = useCurrentAccount();
  const { data, isPending, error } = useSuiClientQuery(
    "getOwnedObjects",
    {
      owner: account?.address as string,
      options: {
        showType: true,
      },
      filter: {
        MatchAll: [
          {
            StructType: `${PACKAGE_ID}::game::GameNFT`,
          },
        ]
      }
    },
    {
      enabled: !!account,
    }
  );
  const [NFTs, setNFTs] = useState<string[]>([]);
  const [NFT, setNFT] = useState<string>("");
  useMemo(() => {
    if (!account || error || isPending || !data) {
      return;
    }
    setNFTs(data.data.map((object) => object.data?.objectId as string));
    return;
  }, [account, data, error, isPending]);


  return (
    <Theme>
      <Flex justify="between" align={"center"} style={{ minHeight: 65, maxHeight: 65 }} >
        <Heading color="cyan">TicTacToe</Heading>
        <MintNFT
          onCreated={(nfts) => {
            setNFTs(NFTs.concat(nfts));
          }}
        />
        {
          !account ? (
            <div>please connect first</div>
          ) : (
            <Select.Root onValueChange={(value) => {
              setNFT(value);
            }}>
              <Select.Trigger style={{ minHeight: 65 }} />
              <Select.Content>
                {
                  NFTs.map((nft) => {
                    return (
                      <Select.Item key={nft} value={nft} style={{ height: "70px", width: "235px" }}>
                        <NFTRender id={nft} />
                      </Select.Item>
                    )
                  })
                }
              </Select.Content>
            </Select.Root>
          )
        }
        <ConnectButton />
      </Flex>

      <Container>
        <NFTRenderBoard id={NFT} />
      </Container>

    </Theme >
  )
}