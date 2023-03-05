from brownie import Kebab, accounts

def main():
    acct = accounts.load('deployment_account')
    Kebab.deploy("Kebab", "KB", 18, 1e28, {'from': acct})