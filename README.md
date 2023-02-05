## LOCAL DEPLOYMENT
#### Run metamask node
```
npx hardhat node
```
#### Deploy contracts into hardhat local network
```
npx hardhat run scripts/deploy.js    
```
#### Run front-end static server
```
npm start
```
## TESTING
#### Test and Generate Jest Reports
```
npx hardhat test:jest
```

#### Test and Generate Default Reports
```
npx hardhat coverage
```

## DOCS GENERATOR

#### Internal Docs
```
npx solidity-docgen --solc-module solc-0.8 -t ./docs/template/internal -o ./docs/internal
```

#### External Docs
```
npx solidity-docgen --solc-module solc-0.8 -t ./docs/template/external -o ./docs/external
```

#### Diagrams: [Sol2uml Examples](https://github.com/naddison36/sol2uml/blob/master/examples/README.md)

```
npx sol2uml ./contracts -o ./docs/diagram/DiagramTemplate1.svg
```