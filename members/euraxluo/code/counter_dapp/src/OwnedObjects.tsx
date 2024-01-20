import { useCurrentAccount, useSuiClientQuery } from "@mysten/dapp-kit";
import { Flex, Heading, Text } from "@radix-ui/themes";

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
