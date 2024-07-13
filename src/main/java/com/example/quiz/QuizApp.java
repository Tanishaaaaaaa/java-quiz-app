package com.example.quiz;

import java.util.Scanner;

public class QuizApp {
    public static void main(String[] args) {
        String[] questions = {
            "What is the capital of France?",
            "What is 2 + 2?",
            "Who wrote 'To Kill a Mockingbird'?"
        };
        String[] answers = {
            "Paris",
            "4",
            "Harper Lee"
        };

        Scanner scanner = new Scanner(System.in);
        int score = 0;

        for (int i = 0; i < questions.length; i++) {
            System.out.println(questions[i]);

            // Check if there is input available before reading
            if (scanner.hasNextLine()) {
                String response = scanner.nextLine();

                if (response.equalsIgnoreCase(answers[i])) {
                    score++;
                } else {
                    System.out.println("Incorrect answer. Correct answer is: " + answers[i]);
                }
            } else {
                System.out.println("No input available.");
                // Handle the situation where no input is available
            }
        }

        System.out.println("You scored " + score + " out of " + questions.length);
    }
}
