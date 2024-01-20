<template>
<div>
    <n-select v-model:value="env" :options="options" />
    <n-input-group>
        <n-input v-model:value="address" placeholder="输入钱包地址" :style="{ width: '100%' }" />
        <n-button type="primary" ghost @click="getCoins">
        查询当前账户的Coins
        </n-button>
    </n-input-group>

    <n-data-table
        :columns="columns"
        :data="tableData"
        :bordered="false"
    />
</div>
</template>
<script setup lang="ts">
import { onMounted, ref } from 'vue'
import { useMessage } from 'naive-ui'
import { getFullnodeUrl, SuiClient } from '@mysten/sui.js/client'
import type { CoinStruct } from '@mysten/sui.js/client'
const message = useMessage()
const client = ref<SuiClient>()
const address = ref('')
const env = ref<'devnet'|'mainnet'|'testnet'|'localnet'>('devnet')
const options = [
    {
        label: 'mainnet',
        value: 'mainnet'
    },
    {
        label: 'testnet',
        value: 'testnet'
    },
    {
        label: 'devnet',
        value: 'devnet'
    },
    {
        label: 'localnet',
        value: 'localnet'
    },
]
const columns = ref([
    {
        title: 'coinObjectId',
        key: 'coinObjectId'
    },
    {
        title: 'coinType',
        key: 'coinType'
    },
    {
        title: 'balance',
        key: 'balance'
    },
    {
        title: 'digest',
        key: 'digest'
    },
    {
        title: 'previousTransaction',
        key: 'previousTransaction'
    }
])

const tableData = ref<CoinStruct[]>([])
onMounted(async () => {
    const rpcUrl = getFullnodeUrl(env.value)
    client.value = new SuiClient({ url: rpcUrl })
})

const getCoins = async () => {
if (!address.value) {
    message.error('请输入钱包地址')
    return
}
if (!client.value) {
    return
}
const res = await client.value.getCoins({
    owner: address.value
})
tableData.value = res.data
console.log(res)
}
</script>
<style scoped>
</style>
  