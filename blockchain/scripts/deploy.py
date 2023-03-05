from brownie import Kebab, accounts

def main():
    Kebab.deploy({'from': accounts[0]})
    k = Kebab[0]
    k.tearDown()