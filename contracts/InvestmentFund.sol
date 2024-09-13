// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract InvestmentFund {
    address public fundManager;
    uint256 public totalFund;
    mapping(address => Project) public projects;
    mapping(address => uint256) public investorContributions;

    struct Project {
        uint256 totalContribution;
        uint256 maxContribution;
    }

    constructor() {
        fundManager = msg.sender;
    }

    modifier onlyManager() {
        require(msg.sender == fundManager, "Only the fund manager can perform this action");
        _;
    }

    function createProject(address _projectAddress, uint256 _maxContribution) public onlyManager {
        require(_projectAddress != address(0), "Invalid project address");
        require(_maxContribution > 0, "Maximum contribution must be positive");
        
        Project storage project = projects[_projectAddress];
        require(project.maxContribution == 0, "Project already exists");

        project.maxContribution = _maxContribution;
    }

    function contribute(address _projectAddress) public payable {
        Project storage project = projects[_projectAddress];

        require(project.maxContribution > 0, "Project does not exist");

        uint256 newTotal = project.totalContribution + msg.value;
        require(newTotal <= project.maxContribution, "Contribution exceeds project limit");

        // Update project and investor data
        project.totalContribution = newTotal;
        investorContributions[msg.sender] += msg.value;
        totalFund += msg.value;

        assert(project.totalContribution <= project.maxContribution);
    }

    function withdrawFunds(address _projectAddress) public onlyManager {
        Project storage project = projects[_projectAddress];

        require(project.maxContribution > 0, "Project does not exist");

        uint256 amount = project.totalContribution;
        require(amount > 0, "No funds to withdraw");

        // Reset the project total contribution
        project.totalContribution = 0;

        (bool success, ) = _projectAddress.call{value: amount}("");
        require(success, "Failed to transfer funds");

        assert(totalFund >= amount);
        totalFund -= amount;
    }

    function getProjectStatus(address _projectAddress) public view returns (uint256 totalContribution, uint256 maxContribution) {
        Project storage project = projects[_projectAddress];
        return (project.totalContribution, project.maxContribution);
    }
}
