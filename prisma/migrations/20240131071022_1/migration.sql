-- CreateEnum
CREATE TYPE "NodeType" AS ENUM ('SENTRY_FULL', 'SENTRY_ARCHIVE', 'RPC', 'VALIDATOR');

-- CreateEnum
CREATE TYPE "Role" AS ENUM ('USER', 'VALIDATOR', 'DELEGATOR', 'ADMIN');

-- CreateEnum
CREATE TYPE "Status" AS ENUM ('ACTIVE', 'INACTIVE', 'LOCKED', 'UNSTAKED');

-- CreateEnum
CREATE TYPE "CurrentState" AS ENUM ('OFFBOARDED', 'HEALTHY', 'UNHEALTHY');

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "logoUrl" TEXT,
    "url" TEXT,
    "description" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'USER',
    "validatorId" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "checkpoints" (
    "id" TEXT NOT NULL,
    "validator_id" INTEGER NOT NULL,
    "checkpoint_number" BIGINT NOT NULL,
    "proposer" BOOLEAN NOT NULL,
    "commissioned_reward" TEXT NOT NULL,
    "signer_address" TEXT,
    "timestamp" BIGINT NOT NULL,
    "total_reward" TEXT NOT NULL,
    "transaction_hash" TEXT NOT NULL,
    "validator_reward" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "checkpoints_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "validators" (
    "id" TEXT NOT NULL,
    "validator_Id" INTEGER NOT NULL,
    "owner" TEXT NOT NULL,
    "signer" TEXT NOT NULL,
    "commission_percent" TEXT NOT NULL,
    "signer_public_key" TEXT NOT NULL,
    "self_stake" TEXT NOT NULL,
    "delegated_stake" TEXT NOT NULL,
    "is_In_auction" TEXT NOT NULL,
    "claimed_reward" TEXT NOT NULL,
    "activation_epoch" TEXT NOT NULL,
    "total_staked" TEXT NOT NULL,
    "deactivation_epoch" TEXT NOT NULL,
    "jail_end_epoch" TEXT NOT NULL,
    "status" "Status" NOT NULL,
    "contract_address" TEXT NOT NULL,
    "uptime_percent" INTEGER NOT NULL,
    "delegation_enabled" BOOLEAN NOT NULL,
    "delegator_count" INTEGER NOT NULL,
    "delegator_unclaimed_rewards" BIGINT NOT NULL,
    "validator_unclaimed_rewards" TEXT NOT NULL,
    "delegator_claimed_rewards" TEXT NOT NULL,
    "checkpoints_missed" TEXT NOT NULL,
    "checkpoints_signed" TEXT NOT NULL,
    "missed_latest_checkpointcount" TEXT NOT NULL,
    "performance_Index" TEXT NOT NULL,
    "last_Considered_engagement_checkpoint" TEXT NOT NULL,
    "current_state" "CurrentState" NOT NULL,
    "userId" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "validators_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Delegator" (
    "id" TEXT NOT NULL,
    "amount" TEXT NOT NULL,
    "completed" BOOLEAN NOT NULL,
    "validator_id" INTEGER NOT NULL,
    "bonded_validator" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "claimed_reward" TEXT NOT NULL,
    "shares" TEXT NOT NULL,
    "deactivation_epoch" TEXT NOT NULL,
    "unbond_started_tx_hash" TEXT NOT NULL,
    "unbond_started_timestamp" TEXT NOT NULL,
    "unbond_claimed_tx_hash" TEXT NOT NULL,
    "unbond_claimed_timestamp" TEXT NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Delegator_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Node" (
    "id" TEXT NOT NULL,
    "nodetype" "NodeType" NOT NULL,
    "server_ip" TEXT,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Node_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "validators_userId_key" ON "validators"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Delegator_userId_key" ON "Delegator"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Node_userId_key" ON "Node"("userId");

-- AddForeignKey
ALTER TABLE "validators" ADD CONSTRAINT "validators_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Delegator" ADD CONSTRAINT "Delegator_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Node" ADD CONSTRAINT "Node_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
