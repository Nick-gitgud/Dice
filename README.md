For optimization I picked the highest of the 4 rolls because you don't have to use number1, one of them is fine because they have the same 1/4 chance of occurring. This means you effectively can roll 4 times more rolls for on run meaning you can divide
the total amount of runs by 4. Also If you are only looking for the ones that hit will 177 you can abort runs that can no longer hit 177.Meaning if the highest number + the remaining rolls is smaller then the goal(177) you can stop the current run and
start the next one. Without all the optimizations it took 2h to run, with only one of them 30min.

Dice one is not stopping if the goal is not reached. It's juist doing 1000'0000'0000/4 runs.
In dice2 you can set the goal and it does 1000'0000'0000/4 runs.

