// Copyright 2021-2022, Offchain Labs, Inc.
// For license information, see https://github.com/OffchainLabs/nitro-contracts/blob/main/LICENSE
// SPDX-License-Identifier: BUSL-1.1

import "./Messages.sol";

pragma solidity >=0.6.9 <0.9.0;

/// @notice Delay buffer and delay threshold settings
/// @param threshold The maximum amount of blocks that a message is expected to be delayed
/// @param max The maximum buffer in blocks
/// @param replenishRateInBasis The amount to replenish the buffer per block in basis points.
struct BufferConfig {
    uint64 threshold;
    uint64 max;
    uint64 replenishRateInBasis;
}

/// @notice The delay buffer data.
/// @param blocks The buffer in blocks.
/// @param syncExpiry The block number until no unexpected delays are possible.
/// @param threshold The maximum amount of blocks that a message is expected to be delayed
/// @param max The maximum buffer in blocks
/// @param replenishRateInBasis The amount to replenish the buffer per block in basis points.
/// @param prevBlockNumber The blocknumber of the last included delay message.
/// @param prevDelay The delay in blocks of the last included delay message.
struct BufferData {
    uint64 bufferBlocks;
    uint64 syncExpiry;
    uint64 max;
    uint64 threshold;
    uint64 replenishRateInBasis;
    uint64 prevBlockNumber;
    uint64 prevDelay;
}

struct DelayProof {
    bytes32 beforeDelayedAcc;
    Messages.Message delayedMessage;
}