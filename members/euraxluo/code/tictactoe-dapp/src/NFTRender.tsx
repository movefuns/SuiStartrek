import { useSignAndExecuteTransactionBlock, useSuiClient, useSuiClientQuery } from '@mysten/dapp-kit';
import { SuiObjectData } from '@mysten/sui.js/client';
import { Avatar, Box, Button, Card, Flex, Grid, Text } from '@radix-ui/themes';
import { Cross1Icon, CircleIcon } from '@radix-ui/react-icons'
import { TransactionBlock } from '@mysten/sui.js/transactions';
import { PACKAGE_ID, STATE_ID } from './constants';
import { useEffect, useState } from 'react';

interface NFTField {
    board: number[],
    game_id: string,
    image_url: string,
    round: number,
    state: number,
    tokenId: string,
    turn: number,
    wins: number
}

function getNFTFields(data: SuiObjectData): NFTField {
    if (data.content?.dataType !== 'moveObject') {
        return {
            board: [0, 0, 0, 0, 0, 0, 0, 0, 0],
            game_id: "",
            image_url: "",
            round: 0,
            state: 0,
            tokenId: "",
            turn: 0,
            wins: 0
        };
    }
    return data.content.fields as {
        board: number[],
        game_id: string,
        image_url: string,
        round: number,
        state: number,
        tokenId: string,
        turn: number,
        wins: number
    };
}

export function NFTRender({ id }: { id: string }) {
    const [nftObjectField, setNFTObjectField] = useState<NFTField>({
        board: [0, 0, 0, 0, 0, 0, 0, 0, 0],
        game_id: "",
        image_url: "",
        round: 0,
        state: 0,
        tokenId: "",
        turn: 0,
        wins: 0
    });
    const { data, refetch } = useSuiClientQuery('getObject', {
        id,
        options: {
            showContent: true,
        },
    });

    useEffect(() => {
        if (data?.data) {
            setNFTObjectField(getNFTFields(data?.data) as NFTField);
        }
    }, [data, id])
    return (
        <Card style={{ maxWidth: 240, maxHeight: 80 }}>
            {
                !nftObjectField.game_id ? (
                    <div>Not found {id}</div>
                ) : (
                    <Flex gap="3" align="center">
                        <Avatar
                            size="3"
                            src={nftObjectField.image_url}
                            radius="full"
                            fallback="T"
                        />
                        <Box>
                            <Text as="div" size="2" weight="bold">
                                tokenId:{nftObjectField.tokenId},wins:{nftObjectField.wins}
                            </Text>
                            <Text as="div" size="2" color="gray">
                                round:{nftObjectField.round}
                            </Text>
                        </Box>
                    </Flex>
                )
            }
        </Card>
    );
}

export function NFTRenderBoard({ id }: { id: string }) {
    const [nftObjectField, setNFTObjectField] = useState<NFTField>({
        board: [0, 0, 0, 0, 0, 0, 0, 0, 0],
        game_id: "",
        image_url: "",
        round: 0,
        state: 0,
        tokenId: "",
        turn: 0,
        wins: 0
    });
    const suiClient = useSuiClient();
    const { mutate: signAndExecute } = useSignAndExecuteTransactionBlock();
    const { data, refetch } = useSuiClientQuery('getObject', {
        id,
        options: {
            showContent: true,
        },
    });

    useEffect(() => {
        if (data?.data) {
            setNFTObjectField(getNFTFields(data?.data) as NFTField);
        }
    }, [data, id])
    return (
        <Flex
            justify={"center"}
            align={"center"}
        >
            <Grid
                columns="3"
                rows="3"
                gap="1"
                style={{
                    gridTemplateColumns: 'repeat(3, 150px)',
                    gridTemplateRows: 'repeat(3, 150px)',
                }}
            >
                {
                    !nftObjectField.game_id ? (
                        [1, 2, 3, 4, 5, 6, 7, 8, 9].map((number) => (
                            <Button key={number} style={{ width: 150, height: 150, backgroundColor: '#332d47' }} />
                        ))
                    ) : (
                        nftObjectField.board.map(
                            (tile, i) => (
                                tile == 0 ?
                                    <Button key={i} style={{ width: 150, height: 150, backgroundColor: '#332d47' }} onClick={
                                        () => {
                                            if (data && data.data) {
                                                let board = nftObjectField.board;
                                                board[i] = 2;
                                                executeMoveCallPlay(id, board);
                                            }
                                        }
                                    } />
                                    : tile == 1 ?
                                        <Button key={i} style={{ width: 150, height: 150, backgroundColor: '#332d47' }} >
                                            <Cross1Icon width={120} height={120} />
                                        </Button> :
                                        <Button key={i} style={{ width: 150, height: 150, backgroundColor: '#332d47' }} >
                                            {/*
                                            <Avatar
                                                size="3"
                                                src={nftObjectField.image_url}
                                                radius="full"
                                                fallback="T"
                                            />
                                            */}
                                            <CircleIcon width={120} height={120} />
                                        </Button>
                            )
                        )
                    )
                }
            </Grid>

        </Flex>

    );


    function executeMoveCallPlay(nft: string, board: number[]) {
        const txb = new TransactionBlock();
        txb.moveCall({
            arguments: [txb.object(STATE_ID), txb.object(nft), txb.pure(board)],
            target: `${PACKAGE_ID}::game::play`,
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
                    alert("警告！\n检查defaultNetwork和PACKAGE_ID");
                    console.log(e);
                }
            },
        );
    }

}