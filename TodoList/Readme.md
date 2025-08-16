# Decentralized TodoList Smart Contract

A decentralized, blockchain-based todo list application built on the Conflux network using Solidity smart contracts. This project allows users to manage their tasks in a secure, transparent, and decentralized manner.

## 🚀 Features

- **Add Tasks**: Create new tasks with descriptions
- **Complete Tasks**: Mark tasks as completed
- **Delete Tasks**: Remove tasks from the list
- **View Tasks**: Get task details and count
- **User Isolation**: Each user has their own private task list
- **Event Logging**: All actions are logged as blockchain events
- **Gas Efficient**: Optimized for minimal transaction costs

## 📋 Smart Contract Details

### Contract: `DecentralizedTodoList`

**Network**: Conflux Network  
**Solidity Version**: ^0.8.0  
**License**: MIT

### Core Functions

| Function | Description | Parameters | Returns |
|----------|-------------|------------|---------|
| `addTask(string _description)` | Adds a new task | Task description | None |
| `getTaskCount()` | Returns user's total task count | None | uint256 |
| `getTask(uint256 _index)` | Returns task details by index | Task index | (string, bool) |
| `completeTask(uint256 _index)` | Marks a task as completed | Task index | None |
| `deleteTask(uint256 _index)` | Deletes a task by index | Task index | None |

### Events

- `TaskAdded`: Emitted when a new task is created
- `TaskCompleted`: Emitted when a task is marked as completed  
- `TaskDeleted`: Emitted when a task is deleted

## 🛠️ Prerequisites

- Web browser (Chrome, Firefox, Safari, Edge)
- Remix IDE (online or desktop version)
- Conflux wallet (Fluent, ConfluxPortal, etc.)
- CFX tokens for gas fees

## 📦 Getting Started

1. **Access Remix IDE**
   - Go to [remix.ethereum.org](https://remix.ethereum.org)
   - Or download the desktop version from [GitHub](https://github.com/ethereum/remix-desktop)

2. **Create a new workspace**
   - Click on "Create" in the home tab
   - Choose "Empty workspace" or "From a template"

3. **Add your smart contract**
   - Create a new file named `todolist.sol`
   - Copy and paste the smart contract code

## 🔧 Compilation & Deployment

### Compiling the Contract

1. **Open the Solidity Compiler**
   - Click on the "Solidity Compiler" icon in the left sidebar
   - Make sure the compiler version is set to `0.8.0` or higher

2. **Compile the contract**
   - Click "Compile todolist.sol"
   - Check for any compilation errors in the console
   - The compiled artifacts will appear in the "Compilation Details" section

### Deploying to Conflux Network

1. **Install Conflux Network in Remix**
   - Go to the "Deploy & Run Transactions" tab
   - In the "Environment" dropdown, select "Injected Provider - MetaMask"
   - Make sure your wallet is connected to Conflux network

2. **Configure Conflux Network in your wallet**
   - **Network Name**: Conflux Mainnet
   - **RPC URL**: `https://main.confluxrpc.com`
   - **Chain ID**: `1029`
   - **Currency Symbol**: `CFX`
   - **Block Explorer**: `https://confluxscan.io`

3. **Deploy the contract**
   - Click "Deploy" button
   - Confirm the transaction in your wallet
   - Wait for the transaction to be confirmed
   - Copy the deployed contract address

## 💻 Using the Contract

### Adding Tasks
1. In the "Deployed Contracts" section, find your contract
2. Expand the contract to see all available functions
3. In the `addTask` function input, type your task description
4. Click "Transact" and confirm in your wallet

### Viewing Tasks
1. Use the `getTaskCount()` function to see how many tasks you have
2. Use the `getTask(uint256 _index)` function to view specific tasks
   - Enter the task index (starting from 0)
   - Click "Call" to view the task details

### Completing Tasks
1. Use the `completeTask(uint256 _index)` function
2. Enter the index of the task you want to complete
3. Click "Transact" and confirm in your wallet

### Deleting Tasks
1. Use the `deleteTask(uint256 _index)` function
2. Enter the index of the task you want to delete
3. Click "Transact" and confirm in your wallet

## 🔍 Testing the Contract

### Test Functions
- **`getTaskCount()`**: Should return 0 initially, then increment with each added task
- **`getTask(0)`**: Should return your first task's description and completion status
- **Events**: Check the transaction logs to see emitted events

### Common Test Scenarios
1. Add multiple tasks and verify count increases
2. Complete a task and verify status changes
3. Delete a task and verify count decreases
4. Try to access non-existent tasks (should fail gracefully)

## 📊 Gas Optimization

The contract is optimized for gas efficiency:
- Uses `mapping` for O(1) access to user tasks
- Efficient task deletion using swap-and-pop technique
- Minimal storage operations
- Event emission for off-chain tracking
