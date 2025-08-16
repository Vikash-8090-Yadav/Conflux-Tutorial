# Digital Guestbook Smart Contract

A decentralized guestbook application built on the Conflux eSpace testnet using Solidity smart contracts. This project allows users to leave public messages on the blockchain, creating a permanent and transparent record of interactions.

## 🚀 Features

- **Public Message Storage**: Store messages permanently on the blockchain
- **Timestamp Tracking**: Each message includes a blockchain timestamp
- **Sender Verification**: Messages are linked to the sender's wallet address
- **Event Logging**: Smart contract events for easy frontend integration
- **Gas Efficient**: Optimized for minimal transaction costs

## 📋 Smart Contract Functions

### `addMessage(string memory _content)`
- **Purpose**: Adds a new message to the guestbook
- **Parameters**: `_content` - The message text to store
- **Access**: Public (anyone can call)
- **Gas Cost**: Varies based on message length

### `getMessageCount()`
- **Purpose**: Returns the total number of messages in the guestbook
- **Returns**: `uint256` - Total message count
- **Access**: Public view function (no gas cost)

### `getMessage(uint256 _index)`
- **Purpose**: Retrieves details of a specific message by index
- **Parameters**: `_index` - The position of the message (0-based)
- **Returns**: `(address sender, string content, uint256 timestamp)`
- **Access**: Public view function (no gas cost)

## 🛠️ Development & Deployment

### Prerequisites
- [Remix IDE](https://remix.ethereum.org/) (web-based Solidity IDE)
- [Conflux Portal](https://portal.confluxnetwork.org/) or MetaMask with Conflux eSpace network
- CFX tokens for gas fees on Conflux eSpace testnet

### Compilation in Remix IDE

1. **Open Remix IDE**
   - Navigate to [remix.ethereum.org](https://remix.ethereum.org/)
   - Create a new workspace or use the default one

2. **Create the Contract File**
   - In the file explorer, create a new file named `guestbook.sol`
   - Copy and paste the smart contract code from `guestbook.sol`

3. **Compile the Contract**
   - Go to the "Solidity Compiler" tab
   - Set compiler version to `0.8.0` or higher
   - Click "Compile guestbook.sol"
   - Ensure compilation is successful with no errors

### Deployment on Conflux eSpace Testnet

1. **Configure Network**
   - In Remix, go to the "Deploy & Run Transactions" tab
   - Set environment to "Injected Provider - MetaMask"
   - Ensure MetaMask is connected to Conflux eSpace testnet

2. **Conflux eSpace Testnet Configuration**
   - **Network Name**: Conflux eSpace Testnet
   - **RPC URL**: `https://evmtestnet.confluxrpc.com`
   - **Chain ID**: `71`
   - **Currency Symbol**: `CFX`
   - **Block Explorer**: `https://evmtestnet.confluxscan.io`

3. **Deploy the Contract**
   - Select "DigitalGuestbook" from the contract dropdown
   - Click "Deploy"
   - Confirm the transaction in MetaMask
   - Wait for deployment confirmation

4. **Save Contract Address**
   - Copy the deployed contract address
   - Save it for future interactions

## 💰 Gas Costs

- **Deployment**: ~200,000 - 500,000 gas (varies by network conditions)
- **Adding Message**: ~50,000 - 100,000 gas per message
- **Reading Messages**: Free (view functions)