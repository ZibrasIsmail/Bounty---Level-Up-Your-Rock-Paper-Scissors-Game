import React from "react";

interface Round {
  result: number;
}

function calculateTotalScore(rounds: Round[]): number {
  return rounds.reduce((score, round) => {
    if (round.result === 2) {
      return score + 1;
    }
    return score;
  }, 0);
}

const GameScoreComponent: React.FC<{ roundsData: Round[] }> = ({
  roundsData,
}) => {
  const totalScore = calculateTotalScore(roundsData);

  return (
    <div>
      <h2>Your Total Score: {totalScore}</h2>
    </div>
  );
};

export default GameScoreComponent;
