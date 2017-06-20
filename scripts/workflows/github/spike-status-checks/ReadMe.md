# Spike: Pull Request Feedback 

## Context

### The "why"

- Amplify and shorten feedback loops to developers - crucial as we continue to pursue shortening our path through the value-stream
- Create "tunable" surface area for architects to uphold and increase quality (test coverage in proposed code, rather than in the mainline as it's attempting to go out the door)
- Ensure we are always in a shippable state by vetting all pull-requests before they get into the "mainline" in a transparent way
- Cross-office collaboration can be eased by having a source of truth of "does that commit or pull-request meet these expectations before it gets to a human"

### The "how"

- Enable our build tooling to emit necessary status checks on pull-requests to ensure they are run and passing before a SME manually reviews the proposed changes

### The "what"

#### Phase 1 - [Diagram](https://www.lucidchart.com/invitations/accept/bfcec8fb-5bbd-4480-bd14-d6f12df2c8c2) 
- Simple shell-scripts to mimic the end goal to jump-start the conversation on what tooling we leverage for this effort 
    - Todo
      - [X] Step 2.1.1 [status script](https://github.cdinteractive.com/cj-taylor/dotfiles/blob/master/scripts/workflows/github/spike-status-checks/phase1/step2-1-1.sh) and commit, [image](https://github.cdinteractive.com/cj-taylor/dotfiles/blob/master/scripts/workflows/github/spike-status-checks/phase1/step-2-1-1.png) - initial commit
      - [X] Step 2.1.2 [status script](https://github.cdinteractive.com/cj-taylor/dotfiles/blob/master/scripts/workflows/github/spike-status-checks/phase1/step2-1-2.sh) and commit, [image](https://github.cdinteractive.com/cj-taylor/dotfiles/blob/master/scripts/workflows/github/spike-status-checks/phase1/step-2-1-2.png) - build failure 
      - [X] Step 2.2.1 [status script](https://github.cdinteractive.com/cj-taylor/dotfiles/blob/master/scripts/workflows/github/spike-status-checks/phase1/step2-2-1.sh) and commit, [image](https://github.cdinteractive.com/cj-taylor/dotfiles/blob/master/scripts/workflows/github/spike-status-checks/phase1/step-2-2-1.png) - build fixed, tests fail 
      - [X] Step 2.3.1 [status script](https://github.cdinteractive.com/cj-taylor/dotfiles/blob/master/scripts/workflows/github/spike-status-checks/phase1/step2-3-1.sh) and commit, [image](https://github.cdinteractive.com/cj-taylor/dotfiles/blob/master/scripts/workflows/github/spike-status-checks/phase1/step-2-3-1.png) - build success, tests success, approval pending 
      - Await SME Approval  
      - SME Appoved 
      - Merged 
- Phase 1 completed via https://github.cdinteractive.com/cj-taylor/tsui/pull/4
      
#### Phase 2 
- **Note:** Scope and depth of this and subsequent phases are subject to input from conversations from phase1 results. Awaiting feedback and blessing from architects to continue R&D.
- Explore existing tools and what it'd take for us to leverage them for this purpose 
    - Preliminatary research before execution of phase2
      - TeamCity: 
        - https://github.com/jonnyzzz/TeamCity.GitHub
      - Jenkins: 
        - https://github.com/jenkinsci/github-plugin
        - https://github.com/jenkinsci/pipeline-githubnotify-step-plugin
- Document for comparison for the necessary stakeholders to come to an agreement 

#### Phase 3 
- Proof of concept in tooling 

#### Phase 4 
- Share this workflow and solution with others to spread the operational benefits through the organization
    
## FAQ

### Why start with TSUI?
 
TSUI is a dependency used within mobile, tux, and desktop - where much churn occurs. 
It's a ripe target to amplify feedback to the developers before their changes land in the branches used for deployment purposes.
This can mitigate delayed feedback and swarming reactions when many people are notified of build-on-deploy-time-issues when the dev could have self-error-corrected at the pull-request stage of contribution.

### Is this practice limited to TSUI?
 
Not at all. TSUI is just a starting point. All projects and layers of our application can benefit from this workflow to vette candidate code-changes before they become part of the source used for distribution. 
