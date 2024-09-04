# Rock Paper Scissors Game on Aptos

## Technologies Used

- Move (Aptos smart contract language)
- React 18
- TypeScript
- Vite
- Aptos SDK
- Styled Components
- Petra Wallet Adapter

## Features

- Play Rock Paper Scissors against a computer opponent
- Smart contract implemented in Move on the Aptos blockchain
- React frontend for easy interaction with the game
- Wallet integration using Petra Wallet
- Keep track of game history and scores
- Restart functionality for endless gameplay

## Project Structure

rock-paper-scissors/
├── sources/
│ └── RockPaperScissors.move
├── rock-paper-scissor-frontend/
│ ├── src/
│ │ ├── App.tsx
│ │ ├── main.tsx
│ │ └── gameScore.tsx
│ ├── .env
│ └── package.json
└── README.md

## Smart Contract

The `RockPaperScissors.move` contract handles:

- Game initialization
- Playing rounds
- Determining winners
- Storing game history

## Frontend

The React frontend provides:

- Wallet connection
- Game controls
- Move selection
- Result display
- Score tracking

## Environment Setup

1. **Aptos CLI**: Install from [Aptos CLI GitHub](https://github.com/aptos-labs/aptos-core/releases)
2. **Node.js**: Install version 14 or later from [nodejs.org](https://nodejs.org/)
3. **Petra Wallet**: Install the browser extension from [Petra Wallet](https://petra.app/)

## Installation and Running

1. Clone the repository:

   ```
   git clone https://github.com/ZibrasIsmail/Bounty---Level-Up-Your-Rock-Paper-Scissors-Game
   cd rock-paper-scissors-aptos
   ```

2. Deploy the smart contract:

   ```
   aptos move publish
   ```

3. Set up the frontend:

   ```
   cd rock-paper-scissor-frontend
   npm install
   ```

4. Update `.env` with your contract address
   ```
   MODULE_ADDRESS=""
   MODULE_NAME=""
   ```

5. Run the frontend:

   ```
   npm run dev
   ```

6. Open `http://localhost:5173` in your browser

## Game Flow Diagram

mermaid
graph TD
A[Start] --> B[Connect Wallet]
B --> C[Initialize Game]
C --> D[Player Selects Move]
D --> E[Smart Contract Generates Computer Move]
E --> F[Determine Winner]
F --> G[Update Score]
G --> H[Display Result]
H --> I{Play Again?}
I -->|Yes| D
I -->|No| J[End]

## How to Play

1. Connect your Petra Wallet
2. Click "Start Game"
3. Choose Rock, Paper, or Scissors
4. View the result and computer's move
5. Your total score is shown at the bottom
