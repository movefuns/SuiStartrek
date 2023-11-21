import { ConnectButton, useCurrentAccount } from "@mysten/dapp-kit";
import { Box, Container, Flex, Heading } from "@radix-ui/themes";
import { WalletStatus } from "./WalletStatus";

import { isValidSuiObjectId } from '@mysten/sui.js/utils';
import { useState } from 'react';
import { CreateCounter } from './Counter'
import { Counter } from './Counter'

function App() {
  const currentAccount = useCurrentAccount();
  const [counterId, setCounter] = useState(() => {
    const hash = window.location.hash.slice(1);
    return isValidSuiObjectId(hash) ? hash : null;
  });

  return (
    <>
      <Flex
        position="sticky"
        px="4"
        py="2"
        justify="between"
        style={{
          borderBottom: "1px solid var(--gray-a2)",
        }}
      >
        <Box>
          <Heading>Counter dApp</Heading>
        </Box>

        <Box>
          <ConnectButton />
        </Box>
      </Flex>

      <Container>
        <Container
          mt="5"
          pt="2"
          px="4"
          style={{ background: "var(--gray-a2)", minHeight: 500 }}
        >
          <section>
            Counter ObjectID: {counterId}
            <div/>
            <input
              type="text"
              placeholder="Enter ObjectID"
              onChange={(e) => {
                console.log("text change to: "+e.target.value);
                setCounter(e.target.value)
              }}
            />
            <div/>
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


          <WalletStatus />

        </Container>
      </Container>
    </>
  );
}

export default App;

