# 🧠 On-Chain Quiz Smart Contract

A simple **on-chain quiz system** built with Solidity, designed to verify answers transparently and securely using blockchain technology.

---
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/3362184d-c1ef-439f-bd49-e95c64253373" />

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/408c5413-2977-42d6-aebd-ab2a1287ff4b" />

## 📘 Project Description

The **On-Chain Quiz** project demonstrates how blockchain can be used for **decentralized learning and verification**.  
Each question and answer is stored directly on-chain, and users can attempt quizzes knowing that results are **tamper-proof** and **publicly verifiable**.

This smart contract is deployed on the **Celo Sepolia Testnet** and is ideal for learning purposes or as a foundation for more advanced quiz or educational dApps.

---

## ⚙️ What It Does

1. **Quiz Creation:**  
   The contract owner (admin) can create quiz questions, along with their correct answers (which are securely hashed before being stored on-chain).

2. **Answer Submission:**  
   Any user can submit answers to questions. The contract automatically checks correctness by comparing the hashed values.

3. **Score Tracking:**  
   Each user’s score is stored on the blockchain, allowing transparency and trust in results.

4. **Question Access:**  
   Users can view quiz questions and check their current scores anytime.

---

## 🌟 Features

- ✅ **Decentralized & Transparent:** Everything happens on-chain — no centralized server required.  
- 🔒 **Secure Answer Verification:** Correct answers are stored as cryptographic hashes, hiding real answers from the public.  
- 👥 **User Score Tracking:** Each participant’s performance is permanently stored.  
- 👨‍🏫 **Admin Controls:** Only the contract owner can add or manage quiz questions.  
- ⚡ **Lightweight & Gas Efficient:** Simple data structures and mappings for optimized blockchain usage.

---

## 🧩 Smart Contract Details

- **Language:** Solidity `^0.8.0`  
- **Network:** Celo Sepolia Testnet  
- **License:** MIT  

### 🛠️ Contract Address
👉 [View on Celo Block Explorer](https://celo-sepolia.blockscout.com/address/0xb71AE4F6FAd588EDDCDd32A19fABEeF47DAA8f5d?tab=txs)

---

## 🚀 Example Usage

### 1️⃣ Add a Question (Owner Only)
```solidity
addQuestion("What is the capital of France?", "Paris");
