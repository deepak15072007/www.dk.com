<!DOCTYPE html>
<html lang="en">
<head>
  <h1>deepak kumar gharan</h1>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guess the Number Game</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>Guess the Number Game</h1>
    <p>Guess a number between 1 and 100:</p>
    <input type="text" id="guessInput">
    <input type="submit" value="Submit Guess" id="guessSubmit">
    <p id="message"></p>

    <script>
        // Generate a random number between 1 and 100
        const targetNumber = Math.floor(Math.random() * 100) + 1;

        // Initialize variables
        let attempts = 0;

        // Get elements from the DOM
        const guessInput = document.getElementById('guessInput');
        const guessSubmit = document.getElementById('guessSubmit');
        const message = document.getElementById('message');

        // Event listener for the Submit button
        guessSubmit.addEventListener('click', checkGuess);

        // Function to check the guessed number
        function checkGuess() {
            const userGuess = parseInt(guessInput.value);
            attempts++;

            if (isNaN(userGuess) || userGuess < 1 || userGuess > 100) {
                message.textContent = 'Please enter a valid number between 1 and 100.';
            } else {
                if (userGuess === targetNumber) {
                    message.textContent = `Congratulations! You guessed the number ${targetNumber} in ${attempts} attempts!`;
                    guessInput.disabled = true;
                    guessSubmit.disabled = true;
                } else if (userGuess < targetNumber) {
                    message.textContent = 'Try a higher number.';
                } else {
                    message.textContent = 'Try a lower number.';
                }
            }
        }
    </script>
</body>
</html>
