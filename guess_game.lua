local difficultyChoose = true
local gameOn = true
local playAgain = true
local function fPlayAgain()
    print('Press ENTER to play again or type anything to close')
            local choice = io.read()

            if choice == '' then
                playAgain = true
                difficultyChoose = true
                gameOn = false

            else
                playAgain = false
                gameOn = false
            end
end

local difficultyTable = {}
function difficultyTable.new(name, numberMax, hotColdFar, hotColdClose)
    return {
        name = name,
        numberMax = numberMax,
        hotColdFar = hotColdFar,
        hotColdClose = hotColdClose
        
    }
end

difficultyTable.levels = {
difficultyTable.new('easy', 100, 30, 10),
difficultyTable.new('medium', 500, 150, 50),
difficultyTable.new('hard', 1000, 300, 100)
}
local inputDifficulty
local difficulty

while playAgain do
    while difficultyChoose do
        print('=-=-=-=-=-=-=-=-=-=-=-=GUESS GAME=-=-=-=-=-=-=-=-=-=-=-=')
        print('Choose the difficulty: Easy [1], Medium [2] or Hard [3]:')
        inputDifficulty = io.read()
        difficulty = difficultyTable.levels[tonumber(inputDifficulty)]
        
        if inputDifficulty == '1' or inputDifficulty == '2' or inputDifficulty == '3' then
            print('\n=-=-=-=-=-=-=-=You chose the ' .. difficulty.name .. ' difficulty!=-=-=-=-=-=-=-=')
            difficultyChoose = false
        else
            print('Choose a difficulty to continue\n')
        end
    end

    math.randomseed(os.time())
    local answer = math.random(difficulty.numberMax)
    local attempt = 1
    gameOn = true
    print('Type a number between 1 and ' .. difficulty.numberMax .. ' and try to guess the correct')
    print('REMEMBER: You can always forfeit typing "y"\n')

    while gameOn do
        print('Attempt number ' .. attempt .. ':')
        local guess = io.read()
        local number = tonumber(guess)

        if guess == 'y' or guess == 'Y' then
            print('\nThe correct answer was ' .. answer .. '\nYou gave up with ' .. attempt .. ' attempts\n')
            fPlayAgain()

        elseif number == nil then
            print('Your guess have to be a number. Try again.\n')

        elseif number > difficulty.numberMax or number < 1 or number % 1 ~= 0 then
            print('Your number has to be an integer between 1 and ' .. difficulty.numberMax .. '. Try again.\n')

        elseif number == answer then
            print('You are correct! Congratulations, you won the game in ' .. attempt .. ' attempts!')
            fPlayAgain()

        elseif number > answer then
            if number < (answer + difficulty.hotColdClose) then
                print('HOT, HOT, HOT! You are very close, try a smaller number!\n')
            
            elseif number < (answer + difficulty.hotColdFar) then
                print("It's warm! You are getting close, try a smaller number.\n")

            else
                print('You are freezing. Your guess was very far from the answer. Try a smaller number.\n')
            end
            attempt = attempt + 1

        elseif number < answer then
            if number > (answer - difficulty.hotColdClose) then
                print('HOT, HOT, HOT! You are very close, try a bigger number!\n')
            
            elseif number > (answer - difficulty.hotColdFar) then
                print("It's warm! You are getting close, try a bigger number.\n")

            else
                print('You are freezing. Your guess was very far from the answer. Try a bigger number.\n')
            end
            attempt = attempt + 1
        end
    end
end