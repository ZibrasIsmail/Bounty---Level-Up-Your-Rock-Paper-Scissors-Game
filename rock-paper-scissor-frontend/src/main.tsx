import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";
import App from "./App";
import { AptosWalletAdapterProvider } from "@aptos-labs/wallet-adapter-react";
import { PetraWallet } from "petra-plugin-wallet-adapter";

const wallets = [new PetraWallet()];

ReactDOM.createRoot(document.getElementById("root")!).render(
  <React.StrictMode>
    <AptosWalletAdapterProvider plugins={wallets} autoConnect={false}>
      <App />
    </AptosWalletAdapterProvider>
  </React.StrictMode>
);
