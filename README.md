# Hinkal-Contracts-Circuits

Core smart contracts and zero-knowledge circuits behind [Hinkal Protocol](https://hinkal.io) — a privacy-focused DeFi protocol enabling private transactions on Ethereum and other EVM chains. Users deposit funds into shielded balances represented as UTXOs; spending requires a zero-knowledge proof (Circom/Groth16) verified on-chain before the contracts release or transform funds.

This repository contains only the on-chain logic and proof system — no tests, mocks, deployment scripts, or off-chain infrastructure.

## Structure

- `contracts/` — protocol logic: `Hinkal.sol`/`HinkalBase.sol` (main entry, shielded balances), `Merkle.sol`/`MerkleBase.sol` (commitment tree), `VerifierFacade.sol` (proof verification dispatch), `RelayStore.sol`, wallet factory contracts, the Emporium system and other external action adapters (`external-actions/`), Groth16 verifiers (`verifiers/`), interfaces and shared structs (`types/`), shared libraries (`lib/`)
- `circuits/` — `MainEVMCircuit.circom` and `MainEVMCircuitMin.circom`, plus their dependency chain: nullifier calculation, UTXO commitment calculation, Merkle inclusion proofs, stealth address derivation, and signature verification
