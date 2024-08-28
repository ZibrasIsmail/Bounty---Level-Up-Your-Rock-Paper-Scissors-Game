import { Aptos, AptosConfig, Network } from "@aptos-labs/ts-sdk";

export const ROCK = 1;
export const PAPER = 2;
export const SCISSORS = 3;

const aptosConfig = new AptosConfig({ network: Network.TESTNET });
export const aptos = new Aptos(aptosConfig);

export const moduleAddress = import.meta.env.VITE_APP_MODULE_ADDRESS;
export const moduleName = import.meta.env.VITE_APP_MODULE_NAME;
