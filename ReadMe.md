# Dotfiles

> This is my dotfile. There are many like, but this one is mine. 
>
> My dotfile is my best friend. It is my life, I must master it as I must master my life. 
>
> --<cite>Personally Altered [Rifleman's Creed][1] - </cite>

[1]:https://en.wikipedia.org/wiki/Rifleman's_Creed
Personal configurations, scripts, documentation, oh ... and [dotfiles](https://dotfiles.github.io/). The goal? Script all the things.

## Highlights 

### Disaster recovery / Onboarding 
- [`New computer? No problem. Grab coffee and let it configure itself.`](https://github.cdinteractive.com/cj-taylor/dotfiles/tree/master/scripts/workflows/new-computer)

### Day-to-day 
- [`Found something in a project that's highly manual and want to script away the problem for now?`](https://github.cdinteractive.com/cj-taylor/dotfiles/tree/master/scripts/projects)
    - Note: Try to solve the root problem after you apply a bandaid like this. 
- [`Can't remember how you installed that one thing? Script it out for next time.`](https://github.cdinteractive.com/cj-taylor/dotfiles/tree/master/scripts/apps)
- [`Want to share a scripted workflow with future you or others?`](https://github.cdinteractive.com/cj-taylor/dotfiles/tree/master/scripts/workflows)

### Role-Specific Helpers 
- [`Frontend Devs`](https://github.cdinteractive.com/cj-taylor/dotfiles/tree/master/scripts/workflows/frontend)

### TODO: 
- [ ] [`X Release has a problem in it. Pull X and build everything locally to replicate in the VM`]()
- [x] [`Machine tooling (install nvm/n, grunt-cli globally)`](https://github.cdinteractive.com/cj-taylor/dotfiles/tree/master/scripts/apps) 
- [x] [`scripts (get chrome/firefox)`](https://github.cdinteractive.com/cj-taylor/dotfiles/tree/master/scripts/apps) 
- [ ] [`Watchers for individual projects`]()
- [ ] [`Watchers on dependent projects (ex: tux watching for tsui changes)`]() 
- [ ] [`npm package.json consolidation - no nested`]() 
- [ ] [`npm package.json - explicit version pinning`]() 

NOTE: don't use ng-components due to desktop not using ng 1.5 (can explicitly include via drupal if necessary; gross)

## Usage

### Get the goods 

```
git clone https://github.cdinteractive.com/cj-taylor/dotfiles.git
cd dotfiles
./install.sh
```

### Update the goods 

Edit `dotfiles`, then use the alias to install/commit/push.

```
dotfiles-update
```
