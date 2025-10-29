// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OnChainQuiz {
    // Address of the quiz creator (admin)
    address public owner;

    // Question structure
    struct Question {
        string questionText;
        bytes32 correctAnswerHash; // Store hashed answer for security
        bool exists;
    }

    // Mapping question IDs to Question data
    mapping(uint256 => Question) public questions;

    // Mapping to track user scores
    mapping(address => uint256) public scores;

    // Count of total questions
    uint256 public questionCount;

    // Events
    event QuestionAdded(uint256 indexed questionId, string questionText);
    event AnswerSubmitted(address indexed user, uint256 indexed questionId, bool isCorrect);

    // Modifier to restrict actions to owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor() {
        owner = msg.sender; // Set contract deployer as owner
    }

    // --- Owner adds a question ---
    function addQuestion(string memory _questionText, string memory _correctAnswer) public onlyOwner {
        questionCount++;
        questions[questionCount] = Question({
            questionText: _questionText,
            correctAnswerHash: keccak256(abi.encodePacked(_correctAnswer)),
            exists: true
        });

        emit QuestionAdded(questionCount, _questionText);
    }

    // --- User submits an answer ---
    function submitAnswer(uint256 _questionId, string memory _answer) public {
        require(questions[_questionId].exists, "Question does not exist");

        // Check if user's answer matches the stored hash
        bool isCorrect = (keccak256(abi.encodePacked(_answer)) == questions[_questionId].correctAnswerHash);

        if (isCorrect) {
            scores[msg.sender] += 1;
        }

        emit AnswerSubmitted(msg.sender, _questionId, isCorrect);
    }

    // --- View user score ---
    function getScore(address _user) public view returns (uint256) {
        return scores[_user];
    }

    // --- View a question text ---
    function getQuestion(uint256 _questionId) public view returns (string memory) {
        require(questions[_questionId].exists, "Question not found");
        return questions[_questionId].questionText;
    }
}

