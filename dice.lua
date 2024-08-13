local LogLocation = 'C:\\Users\\Public\\Dice.log' --for windows
local Numbers = {0,0,0,0}
local Rolls = 0
local MaxOnes = 0
local TotalMax = 0
local StartTime = 0
local StopTime = 0
local RunningTime = 0
local NumberOfTurns = 231--231
local NumberOfRolls = 1000000--1000000000/4 -- can divide by 4 because you don't care witch of the 4 1/4 chanses it is they all have the same 1/4 chanse to occur.

function write_log(str) -- appends string to a log file
  local location = LogLocation
  local file= io.open(location, "a")
  file:write (str)
  file:write ('\n')
  io.close(file)
end

local function disp_time(seconds) -- converts seconds to days:hours:minutes:seconds
  local days = math.floor(seconds / 86400)
  seconds = seconds - days * 86400
  local hours = math.floor(seconds / 3600 )
  seconds = seconds - hours * 3600
  local minutes = math.floor(seconds / 60) 
  seconds = seconds - minutes * 60
  return string.format("%d:%d:%d:%f",days,hours,minutes,seconds)
end

StartTime = os.clock() -- get the start time in seconds
print("Start time: ",os.date()) -- print start time
write_log("Start time: "..os.date()) -- log start time
math.randomseed(os.clock()*100000000000) -- Set the seed for the random number generator
while Rolls < NumberOfRolls do -- 1000 number of tries
  Numbers = {0,0,0,0}
	for i=1,NumberOfTurns,1 do -- 231 nr of attack turns 
    local Roll = math.random(1,4) -- Random number between 1 and 4
		Numbers[Roll] = Numbers[Roll] + 1 -- add a roll to the correct number
	end
  MaxOnes = math.max(Numbers[1],Numbers[2],Numbers[3],Numbers[4]) -- select the most frequent number out of the four they all have an 1/4 chanse
  TotalMax = math.max(MaxOnes,TotalMax) -- save the higest number if it is higher then the current high
	Rolls = Rolls + 1
	--print("Roll outcome 1: ",numbers[1] )
	--print("Roll outcome 2: ",numbers[2] )
	--print("Roll outcome 3: ",numbers[3] )
	--print("Roll outcome 4: ",numbers[4] )
	--print("Highest Roll this session:",maxOnes)
	--print("Highest total Roll:",TotalMax)
  --print("Number of Roll Sessions: ",rolls)
end

StopTime = os.clock() --get stop time in seconds
RunningTime = StopTime - StartTime -- calcultate runtime
RunningTime = disp_time(RunningTime) -- convert runtime
print("Stop time: ",os.date())  -- print data
print("Run time in seconds: ",RunningTime)
print("Highest total roll: ",TotalMax)
print("Number of roll sessions: ",Rolls)
write_log("Stop time: "..os.date()) -- logg data
write_log("Run time in seconds: "..RunningTime)
write_log("Highest total roll: "..TotalMax)
write_log("Number of roll sessions: "..Rolls)
