#[test_only]

module token::token_test{

    use token::token::{Self,TOKEN};
    use sui::coin::{Self,Coin,TreasuryCap};
    use sui::test_scenario::{Self,next_tx};
    use std::debug;

    #[test]
    fun mint_and_burn(){
        let addr1 = @0xa;

        let scenario = test_scenario::begin(addr1);

        token::test_init(test_scenario::ctx(&mut scenario));

        next_tx(&mut scenario,addr1);
        {
            let treasury_cap = test_scenario::take_from_sender<TreasuryCap<TOKEN>>(&scenario);
            token::mint(&mut treasury_cap,100,addr1,test_scenario::ctx(&mut scenario));
            test_scenario::return_to_address<TreasuryCap<TOKEN>>(addr1,treasury_cap);
        };

        next_tx(&mut scenario,addr1);
        {
            let coin = test_scenario::take_from_sender<Coin<TOKEN>>(&scenario);
            debug::print(&coin);
            assert!(coin::value(&coin) == 100, 0);
            let treasurycap = test_scenario::take_from_sender<TreasuryCap<TOKEN>>(&scenario);
            token::burn(&mut treasurycap, coin);
            test_scenario::return_to_address<TreasuryCap<TOKEN>>(addr1, treasurycap);
        };
        test_scenario::end(scenario);
    }
}