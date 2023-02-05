# Solidity API

## ILendingPoolAddressesProvider

_Main registry of addresses part of or connected to the protocol, including permissioned roles
- Acting also as factory of proxies and admin of those, so with right to change its implementations
- Owned by the Aave Governance_

### MarketIdSet

```solidity
event MarketIdSet(string newMarketId)
```

### LendingPoolUpdated

```solidity
event LendingPoolUpdated(address newAddress)
```

### ConfigurationAdminUpdated

```solidity
event ConfigurationAdminUpdated(address newAddress)
```

### EmergencyAdminUpdated

```solidity
event EmergencyAdminUpdated(address newAddress)
```

### LendingPoolConfiguratorUpdated

```solidity
event LendingPoolConfiguratorUpdated(address newAddress)
```

### LendingPoolCollateralManagerUpdated

```solidity
event LendingPoolCollateralManagerUpdated(address newAddress)
```

### PriceOracleUpdated

```solidity
event PriceOracleUpdated(address newAddress)
```

### LendingRateOracleUpdated

```solidity
event LendingRateOracleUpdated(address newAddress)
```

### ProxyCreated

```solidity
event ProxyCreated(bytes32 id, address newAddress)
```

### AddressSet

```solidity
event AddressSet(bytes32 id, address newAddress, bool hasProxy)
```

### getMarketId

```solidity
function getMarketId() external view returns (string)
```

### setMarketId

```solidity
function setMarketId(string marketId) external
```

### setAddress

```solidity
function setAddress(bytes32 id, address newAddress) external
```

### setAddressAsProxy

```solidity
function setAddressAsProxy(bytes32 id, address impl) external
```

### getAddress

```solidity
function getAddress(bytes32 id) external view returns (address)
```

### getLendingPool

```solidity
function getLendingPool() external view returns (address)
```

### setLendingPoolImpl

```solidity
function setLendingPoolImpl(address pool) external
```

### getLendingPoolConfigurator

```solidity
function getLendingPoolConfigurator() external view returns (address)
```

### setLendingPoolConfiguratorImpl

```solidity
function setLendingPoolConfiguratorImpl(address configurator) external
```

### getLendingPoolCollateralManager

```solidity
function getLendingPoolCollateralManager() external view returns (address)
```

### setLendingPoolCollateralManager

```solidity
function setLendingPoolCollateralManager(address manager) external
```

### getPoolAdmin

```solidity
function getPoolAdmin() external view returns (address)
```

### setPoolAdmin

```solidity
function setPoolAdmin(address admin) external
```

### getEmergencyAdmin

```solidity
function getEmergencyAdmin() external view returns (address)
```

### setEmergencyAdmin

```solidity
function setEmergencyAdmin(address admin) external
```

### getPriceOracle

```solidity
function getPriceOracle() external view returns (address)
```

### setPriceOracle

```solidity
function setPriceOracle(address priceOracle) external
```

### getLendingRateOracle

```solidity
function getLendingRateOracle() external view returns (address)
```

### setLendingRateOracle

```solidity
function setLendingRateOracle(address lendingRateOracle) external
```

## IAsset

_This is an empty interface used to represent either ERC20-conforming token contracts or ETH (using the zero
address sentinel value). We're just relying on the fact that `interface` can be used to declare new address-like
types.

This concept is unrelated to a Pool's Asset Managers._

## DataTypes

### ReserveData

```solidity
struct ReserveData {
  struct DataTypes.ReserveConfigurationMap configuration;
  uint128 liquidityIndex;
  uint128 variableBorrowIndex;
  uint128 currentLiquidityRate;
  uint128 currentVariableBorrowRate;
  uint128 currentStableBorrowRate;
  uint40 lastUpdateTimestamp;
  address aTokenAddress;
  address stableDebtTokenAddress;
  address variableDebtTokenAddress;
  address interestRateStrategyAddress;
  uint8 id;
}
```

### ReserveConfigurationMap

```solidity
struct ReserveConfigurationMap {
  uint256 data;
}
```

### UserConfigurationMap

```solidity
struct UserConfigurationMap {
  uint256 data;
}
```

### InterestRateMode

```solidity
enum InterestRateMode {
  NONE,
  STABLE,
  VARIABLE
}
```

## IERC165

_Interface of the ERC165 standard, as defined in the
https://eips.ethereum.org/EIPS/eip-165[EIP].

Implementers can declare support of contract interfaces, which can then be
queried by others ({ERC165Checker}).

For an implementation, see {ERC165}._

### supportsInterface

```solidity
function supportsInterface(bytes4 interfaceId) external view returns (bool)
```

_Returns true if this contract implements the interface defined by
`interfaceId`. See the corresponding
https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
to learn more about how these ids are created.

This function call must use less than 30 000 gas._

## SafeMath

_Wrappers over Solidity's arithmetic operations.

NOTE: `SafeMath` is generally not needed starting with Solidity 0.8, since the compiler
now has built in overflow checking._

### tryAdd

```solidity
function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256)
```

_Returns the addition of two unsigned integers, with an overflow flag.

_Available since v3.4.__

### trySub

```solidity
function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256)
```

_Returns the substraction of two unsigned integers, with an overflow flag.

_Available since v3.4.__

### tryMul

```solidity
function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256)
```

_Returns the multiplication of two unsigned integers, with an overflow flag.

_Available since v3.4.__

### tryDiv

```solidity
function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256)
```

_Returns the division of two unsigned integers, with a division by zero flag.

_Available since v3.4.__

### tryMod

```solidity
function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256)
```

_Returns the remainder of dividing two unsigned integers, with a division by zero flag.

_Available since v3.4.__

### add

```solidity
function add(uint256 a, uint256 b) internal pure returns (uint256)
```

_Returns the addition of two unsigned integers, reverting on
overflow.

Counterpart to Solidity's `+` operator.

Requirements:

- Addition cannot overflow._

### sub

```solidity
function sub(uint256 a, uint256 b) internal pure returns (uint256)
```

_Returns the subtraction of two unsigned integers, reverting on
overflow (when the result is negative).

Counterpart to Solidity's `-` operator.

Requirements:

- Subtraction cannot overflow._

### mul

```solidity
function mul(uint256 a, uint256 b) internal pure returns (uint256)
```

_Returns the multiplication of two unsigned integers, reverting on
overflow.

Counterpart to Solidity's `*` operator.

Requirements:

- Multiplication cannot overflow._

### div

```solidity
function div(uint256 a, uint256 b) internal pure returns (uint256)
```

_Returns the integer division of two unsigned integers, reverting on
division by zero. The result is rounded towards zero.

Counterpart to Solidity's `/` operator.

Requirements:

- The divisor cannot be zero._

### mod

```solidity
function mod(uint256 a, uint256 b) internal pure returns (uint256)
```

_Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
reverting when dividing by zero.

Counterpart to Solidity's `%` operator. This function uses a `revert`
opcode (which leaves remaining gas untouched) while Solidity uses an
invalid opcode to revert (consuming all remaining gas).

Requirements:

- The divisor cannot be zero._

### sub

```solidity
function sub(uint256 a, uint256 b, string errorMessage) internal pure returns (uint256)
```

_Returns the subtraction of two unsigned integers, reverting with custom message on
overflow (when the result is negative).

CAUTION: This function is deprecated because it requires allocating memory for the error
message unnecessarily. For custom revert reasons use {trySub}.

Counterpart to Solidity's `-` operator.

Requirements:

- Subtraction cannot overflow._

### div

```solidity
function div(uint256 a, uint256 b, string errorMessage) internal pure returns (uint256)
```

_Returns the integer division of two unsigned integers, reverting with custom message on
division by zero. The result is rounded towards zero.

Counterpart to Solidity's `/` operator. Note: this function uses a
`revert` opcode (which leaves remaining gas untouched) while Solidity
uses an invalid opcode to revert (consuming all remaining gas).

Requirements:

- The divisor cannot be zero._

### mod

```solidity
function mod(uint256 a, uint256 b, string errorMessage) internal pure returns (uint256)
```

_Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
reverting with custom message when dividing by zero.

CAUTION: This function is deprecated because it requires allocating memory for the error
message unnecessarily. For custom revert reasons use {tryMod}.

Counterpart to Solidity's `%` operator. This function uses a `revert`
opcode (which leaves remaining gas untouched) while Solidity uses an
invalid opcode to revert (consuming all remaining gas).

Requirements:

- The divisor cannot be zero._

## IAccessControl

_External interface of AccessControl declared to support ERC165 detection._

### RoleAdminChanged

```solidity
event RoleAdminChanged(bytes32 role, bytes32 previousAdminRole, bytes32 newAdminRole)
```

_Emitted when `newAdminRole` is set as ``role``'s admin role, replacing `previousAdminRole`

`DEFAULT_ADMIN_ROLE` is the starting admin for all roles, despite
{RoleAdminChanged} not being emitted signaling this.

_Available since v3.1.__

### RoleGranted

```solidity
event RoleGranted(bytes32 role, address account, address sender)
```

_Emitted when `account` is granted `role`.

`sender` is the account that originated the contract call, an admin role
bearer except when using {AccessControl-_setupRole}._

### RoleRevoked

```solidity
event RoleRevoked(bytes32 role, address account, address sender)
```

_Emitted when `account` is revoked `role`.

`sender` is the account that originated the contract call:
  - if using `revokeRole`, it is the admin role bearer
  - if using `renounceRole`, it is the role bearer (i.e. `account`)_

### hasRole

```solidity
function hasRole(bytes32 role, address account) external view returns (bool)
```

_Returns `true` if `account` has been granted `role`._

### getRoleAdmin

```solidity
function getRoleAdmin(bytes32 role) external view returns (bytes32)
```

_Returns the admin role that controls `role`. See {grantRole} and
{revokeRole}.

To change a role's admin, use {AccessControl-_setRoleAdmin}._

### grantRole

```solidity
function grantRole(bytes32 role, address account) external
```

_Grants `role` to `account`.

If `account` had not been already granted `role`, emits a {RoleGranted}
event.

Requirements:

- the caller must have ``role``'s admin role._

### revokeRole

```solidity
function revokeRole(bytes32 role, address account) external
```

_Revokes `role` from `account`.

If `account` had been granted `role`, emits a {RoleRevoked} event.

Requirements:

- the caller must have ``role``'s admin role._

### renounceRole

```solidity
function renounceRole(bytes32 role, address account) external
```

_Revokes `role` from the calling account.

Roles are often managed via {grantRole} and {revokeRole}: this function's
purpose is to provide a mechanism for accounts to lose their privileges
if they are compromised (such as when a trusted device is misplaced).

If the calling account had been granted `role`, emits a {RoleRevoked}
event.

Requirements:

- the caller must be `account`._

## IAaveController

### approveToAAve

```solidity
function approveToAAve(address _asset, uint256 _amount) external
```

### deposit

```solidity
function deposit(address _asset, uint256 _amount) external
```

### redeem

```solidity
function redeem(address _asset, uint256 _amount, address _to) external
```

### getAavebalance

```solidity
function getAavebalance(address _asset) external view returns (uint256)
```

### claimRewards

```solidity
function claimRewards(address _asset) external
```

### getRewardBalance

```solidity
function getRewardBalance(address _asset) external view returns (uint256)
```

## AccessControl

_Contract module that allows children to implement role-based access
control mechanisms. This is a lightweight version that doesn't allow enumerating role
members except through off-chain means by accessing the contract event logs. Some
applications may benefit from on-chain enumerability, for those cases see
{AccessControlEnumerable}.

Roles are referred to by their `bytes32` identifier. These should be exposed
in the external API and be unique. The best way to achieve this is by
using `public constant` hash digests:

```
bytes32 public constant MY_ROLE = keccak256("MY_ROLE");
```

Roles can be used to represent a set of permissions. To restrict access to a
function call, use {hasRole}:

```
function foo() public {
    require(hasRole(MY_ROLE, msg.sender));
    ...
}
```

Roles can be granted and revoked dynamically via the {grantRole} and
{revokeRole} functions. Each role has an associated admin role, and only
accounts that have a role's admin role can call {grantRole} and {revokeRole}.

By default, the admin role for all roles is `DEFAULT_ADMIN_ROLE`, which means
that only accounts with this role will be able to grant or revoke other
roles. More complex role relationships can be created by using
{_setRoleAdmin}.

WARNING: The `DEFAULT_ADMIN_ROLE` is also its own admin: it has permission to
grant and revoke this role. Extra precautions should be taken to secure
accounts that have been granted it._

### RoleData

```solidity
struct RoleData {
  mapping(address &#x3D;&gt; bool) members;
  bytes32 adminRole;
}
```

### _roles

```solidity
mapping(bytes32 => struct AccessControl.RoleData) _roles
```

### DEFAULT_ADMIN_ROLE

```solidity
bytes32 DEFAULT_ADMIN_ROLE
```

### onlyRole

```solidity
modifier onlyRole(bytes32 role)
```

_Modifier that checks that an account has a specific role. Reverts
with a standardized message including the required role.

The format of the revert reason is given by the following regular expression:

 /^AccessControl: account (0x[0-9a-f]{40}) is missing role (0x[0-9a-f]{64})$/

_Available since v4.1.__

### supportsInterface

```solidity
function supportsInterface(bytes4 interfaceId) public view virtual returns (bool)
```

_See {IERC165-supportsInterface}._

### hasRole

```solidity
function hasRole(bytes32 role, address account) public view virtual returns (bool)
```

_Returns `true` if `account` has been granted `role`._

### _checkRole

```solidity
function _checkRole(bytes32 role, address account) internal view virtual
```

_Revert with a standard message if `account` is missing `role`.

The format of the revert reason is given by the following regular expression:

 /^AccessControl: account (0x[0-9a-f]{40}) is missing role (0x[0-9a-f]{64})$/_

### getRoleAdmin

```solidity
function getRoleAdmin(bytes32 role) public view virtual returns (bytes32)
```

_Returns the admin role that controls `role`. See {grantRole} and
{revokeRole}.

To change a role's admin, use {_setRoleAdmin}._

### grantRole

```solidity
function grantRole(bytes32 role, address account) public virtual
```

_Grants `role` to `account`.

If `account` had not been already granted `role`, emits a {RoleGranted}
event.

Requirements:

- the caller must have ``role``'s admin role._

### revokeRole

```solidity
function revokeRole(bytes32 role, address account) public virtual
```

_Revokes `role` from `account`.

If `account` had been granted `role`, emits a {RoleRevoked} event.

Requirements:

- the caller must have ``role``'s admin role._

### renounceRole

```solidity
function renounceRole(bytes32 role, address account) public virtual
```

_Revokes `role` from the calling account.

Roles are often managed via {grantRole} and {revokeRole}: this function's
purpose is to provide a mechanism for accounts to lose their privileges
if they are compromised (such as when a trusted device is misplaced).

If the calling account had been revoked `role`, emits a {RoleRevoked}
event.

Requirements:

- the caller must be `account`._

### _setupRole

```solidity
function _setupRole(bytes32 role, address account) internal virtual
```

_Grants `role` to `account`.

If `account` had not been already granted `role`, emits a {RoleGranted}
event. Note that unlike {grantRole}, this function doesn't perform any
checks on the calling account.

[WARNING]
====
This function should only be called from the constructor when setting
up the initial roles for the system.

Using this function in any other way is effectively circumventing the admin
system imposed by {AccessControl}.
====

NOTE: This function is deprecated in favor of {_grantRole}._

### _setRoleAdmin

```solidity
function _setRoleAdmin(bytes32 role, bytes32 adminRole) internal virtual
```

_Sets `adminRole` as ``role``'s admin role.

Emits a {RoleAdminChanged} event._

### _grantRole

```solidity
function _grantRole(bytes32 role, address account) internal virtual
```

_Grants `role` to `account`.

Internal function without access restriction._

### _revokeRole

```solidity
function _revokeRole(bytes32 role, address account) internal virtual
```

_Revokes `role` from `account`.

Internal function without access restriction._

## IAccessControl

_External interface of AccessControl declared to support ERC165 detection._

### RoleAdminChanged

```solidity
event RoleAdminChanged(bytes32 role, bytes32 previousAdminRole, bytes32 newAdminRole)
```

_Emitted when `newAdminRole` is set as ``role``'s admin role, replacing `previousAdminRole`

`DEFAULT_ADMIN_ROLE` is the starting admin for all roles, despite
{RoleAdminChanged} not being emitted signaling this.

_Available since v3.1.__

### RoleGranted

```solidity
event RoleGranted(bytes32 role, address account, address sender)
```

_Emitted when `account` is granted `role`.

`sender` is the account that originated the contract call, an admin role
bearer except when using {AccessControl-_setupRole}._

### RoleRevoked

```solidity
event RoleRevoked(bytes32 role, address account, address sender)
```

_Emitted when `account` is revoked `role`.

`sender` is the account that originated the contract call:
  - if using `revokeRole`, it is the admin role bearer
  - if using `renounceRole`, it is the role bearer (i.e. `account`)_

### hasRole

```solidity
function hasRole(bytes32 role, address account) external view returns (bool)
```

_Returns `true` if `account` has been granted `role`._

### getRoleAdmin

```solidity
function getRoleAdmin(bytes32 role) external view returns (bytes32)
```

_Returns the admin role that controls `role`. See {grantRole} and
{revokeRole}.

To change a role's admin, use {AccessControl-_setRoleAdmin}._

### grantRole

```solidity
function grantRole(bytes32 role, address account) external
```

_Grants `role` to `account`.

If `account` had not been already granted `role`, emits a {RoleGranted}
event.

Requirements:

- the caller must have ``role``'s admin role._

### revokeRole

```solidity
function revokeRole(bytes32 role, address account) external
```

_Revokes `role` from `account`.

If `account` had been granted `role`, emits a {RoleRevoked} event.

Requirements:

- the caller must have ``role``'s admin role._

### renounceRole

```solidity
function renounceRole(bytes32 role, address account) external
```

_Revokes `role` from the calling account.

Roles are often managed via {grantRole} and {revokeRole}: this function's
purpose is to provide a mechanism for accounts to lose their privileges
if they are compromised (such as when a trusted device is misplaced).

If the calling account had been granted `role`, emits a {RoleRevoked}
event.

Requirements:

- the caller must be `account`._

## Pausable

_Contract module which allows children to implement an emergency stop
mechanism that can be triggered by an authorized account.

This module is used through inheritance. It will make available the
modifiers `whenNotPaused` and `whenPaused`, which can be applied to
the functions of your contract. Note that they will not be pausable by
simply including this module, only once the modifiers are put in place._

### Paused

```solidity
event Paused(address account)
```

_Emitted when the pause is triggered by `account`._

### Unpaused

```solidity
event Unpaused(address account)
```

_Emitted when the pause is lifted by `account`._

### _paused

```solidity
bool _paused
```

### constructor

```solidity
constructor() internal
```

_Initializes the contract in unpaused state._

### paused

```solidity
function paused() public view virtual returns (bool)
```

_Returns true if the contract is paused, and false otherwise._

### whenNotPaused

```solidity
modifier whenNotPaused()
```

_Modifier to make a function callable only when the contract is not paused.

Requirements:

- The contract must not be paused._

### whenPaused

```solidity
modifier whenPaused()
```

_Modifier to make a function callable only when the contract is paused.

Requirements:

- The contract must be paused._

### _pause

```solidity
function _pause() internal virtual
```

_Triggers stopped state.

Requirements:

- The contract must not be paused._

### _unpause

```solidity
function _unpause() internal virtual
```

_Returns to normal state.

Requirements:

- The contract must be paused._

## ReentrancyGuard

_Contract module that helps prevent reentrant calls to a function.

Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
available, which can be applied to functions to make sure there are no nested
(reentrant) calls to them.

Note that because there is a single `nonReentrant` guard, functions marked as
`nonReentrant` may not call one another. This can be worked around by making
those functions `private`, and then adding `external` `nonReentrant` entry
points to them.

TIP: If you would like to learn more about reentrancy and alternative ways
to protect against it, check out our blog post
https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul]._

### _NOT_ENTERED

```solidity
uint256 _NOT_ENTERED
```

### _ENTERED

```solidity
uint256 _ENTERED
```

### _status

```solidity
uint256 _status
```

### constructor

```solidity
constructor() internal
```

### nonReentrant

```solidity
modifier nonReentrant()
```

_Prevents a contract from calling itself, directly or indirectly.
Calling a `nonReentrant` function from another `nonReentrant`
function is not supported. It is possible to prevent this from happening
by making the `nonReentrant` function external, and making it call a
`private` function that does the actual work._

## ERC20

_Implementation of the {IERC20} interface.

This implementation is agnostic to the way tokens are created. This means
that a supply mechanism has to be added in a derived contract using {_mint}.
For a generic mechanism see {ERC20PresetMinterPauser}.

TIP: For a detailed writeup see our guide
https://forum.zeppelin.solutions/t/how-to-implement-erc20-supply-mechanisms/226[How
to implement supply mechanisms].

We have followed general OpenZeppelin Contracts guidelines: functions revert
instead returning `false` on failure. This behavior is nonetheless
conventional and does not conflict with the expectations of ERC20
applications.

Additionally, an {Approval} event is emitted on calls to {transferFrom}.
This allows applications to reconstruct the allowance for all accounts just
by listening to said events. Other implementations of the EIP may not emit
these events, as it isn't required by the specification.

Finally, the non-standard {decreaseAllowance} and {increaseAllowance}
functions have been added to mitigate the well-known issues around setting
allowances. See {IERC20-approve}._

### _balances

```solidity
mapping(address => uint256) _balances
```

### _allowances

```solidity
mapping(address => mapping(address => uint256)) _allowances
```

### _totalSupply

```solidity
uint256 _totalSupply
```

### _name

```solidity
string _name
```

### _symbol

```solidity
string _symbol
```

### constructor

```solidity
constructor(string name_, string symbol_) public
```

_Sets the values for {name} and {symbol}.

The default value of {decimals} is 18. To select a different value for
{decimals} you should overload it.

All two of these values are immutable: they can only be set once during
construction._

### name

```solidity
function name() public view virtual returns (string)
```

_Returns the name of the token._

### symbol

```solidity
function symbol() public view virtual returns (string)
```

_Returns the symbol of the token, usually a shorter version of the
name._

### decimals

```solidity
function decimals() public view virtual returns (uint8)
```

_Returns the number of decimals used to get its user representation.
For example, if `decimals` equals `2`, a balance of `505` tokens should
be displayed to a user as `5.05` (`505 / 10 ** 2`).

Tokens usually opt for a value of 18, imitating the relationship between
Ether and Wei. This is the value {ERC20} uses, unless this function is
overridden;

NOTE: This information is only used for _display_ purposes: it in
no way affects any of the arithmetic of the contract, including
{IERC20-balanceOf} and {IERC20-transfer}._

### totalSupply

```solidity
function totalSupply() public view virtual returns (uint256)
```

_See {IERC20-totalSupply}._

### balanceOf

```solidity
function balanceOf(address account) public view virtual returns (uint256)
```

_See {IERC20-balanceOf}._

### transfer

```solidity
function transfer(address to, uint256 amount) public virtual returns (bool)
```

_See {IERC20-transfer}.

Requirements:

- `to` cannot be the zero address.
- the caller must have a balance of at least `amount`._

### allowance

```solidity
function allowance(address owner, address spender) public view virtual returns (uint256)
```

_See {IERC20-allowance}._

### approve

```solidity
function approve(address spender, uint256 amount) public virtual returns (bool)
```

_See {IERC20-approve}.

NOTE: If `amount` is the maximum `uint256`, the allowance is not updated on
`transferFrom`. This is semantically equivalent to an infinite approval.

Requirements:

- `spender` cannot be the zero address._

### transferFrom

```solidity
function transferFrom(address from, address to, uint256 amount) public virtual returns (bool)
```

_See {IERC20-transferFrom}.

Emits an {Approval} event indicating the updated allowance. This is not
required by the EIP. See the note at the beginning of {ERC20}.

NOTE: Does not update the allowance if the current allowance
is the maximum `uint256`.

Requirements:

- `from` and `to` cannot be the zero address.
- `from` must have a balance of at least `amount`.
- the caller must have allowance for ``from``'s tokens of at least
`amount`._

### increaseAllowance

```solidity
function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool)
```

_Atomically increases the allowance granted to `spender` by the caller.

This is an alternative to {approve} that can be used as a mitigation for
problems described in {IERC20-approve}.

Emits an {Approval} event indicating the updated allowance.

Requirements:

- `spender` cannot be the zero address._

### decreaseAllowance

```solidity
function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool)
```

_Atomically decreases the allowance granted to `spender` by the caller.

This is an alternative to {approve} that can be used as a mitigation for
problems described in {IERC20-approve}.

Emits an {Approval} event indicating the updated allowance.

Requirements:

- `spender` cannot be the zero address.
- `spender` must have allowance for the caller of at least
`subtractedValue`._

### _transfer

```solidity
function _transfer(address from, address to, uint256 amount) internal virtual
```

_Moves `amount` of tokens from `sender` to `recipient`.

This internal function is equivalent to {transfer}, and can be used to
e.g. implement automatic token fees, slashing mechanisms, etc.

Emits a {Transfer} event.

Requirements:

- `from` cannot be the zero address.
- `to` cannot be the zero address.
- `from` must have a balance of at least `amount`._

### _mint

```solidity
function _mint(address account, uint256 amount) internal virtual
```

_Creates `amount` tokens and assigns them to `account`, increasing
the total supply.

Emits a {Transfer} event with `from` set to the zero address.

Requirements:

- `account` cannot be the zero address._

### _burn

```solidity
function _burn(address account, uint256 amount) internal virtual
```

_Destroys `amount` tokens from `account`, reducing the
total supply.

Emits a {Transfer} event with `to` set to the zero address.

Requirements:

- `account` cannot be the zero address.
- `account` must have at least `amount` tokens._

### _approve

```solidity
function _approve(address owner, address spender, uint256 amount) internal virtual
```

_Sets `amount` as the allowance of `spender` over the `owner` s tokens.

This internal function is equivalent to `approve`, and can be used to
e.g. set automatic allowances for certain subsystems, etc.

Emits an {Approval} event.

Requirements:

- `owner` cannot be the zero address.
- `spender` cannot be the zero address._

### _spendAllowance

```solidity
function _spendAllowance(address owner, address spender, uint256 amount) internal virtual
```

_Spend `amount` form the allowance of `owner` toward `spender`.

Does not update the allowance amount in case of infinite allowance.
Revert if not enough allowance is available.

Might emit an {Approval} event._

### _beforeTokenTransfer

```solidity
function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual
```

_Hook that is called before any transfer of tokens. This includes
minting and burning.

Calling conditions:

- when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
will be transferred to `to`.
- when `from` is zero, `amount` tokens will be minted for `to`.
- when `to` is zero, `amount` of ``from``'s tokens will be burned.
- `from` and `to` are never both zero.

To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks]._

### _afterTokenTransfer

```solidity
function _afterTokenTransfer(address from, address to, uint256 amount) internal virtual
```

_Hook that is called after any transfer of tokens. This includes
minting and burning.

Calling conditions:

- when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
has been transferred to `to`.
- when `from` is zero, `amount` tokens have been minted for `to`.
- when `to` is zero, `amount` of ``from``'s tokens have been burned.
- `from` and `to` are never both zero.

To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks]._

## IERC20

_Interface of the ERC20 standard as defined in the EIP._

### totalSupply

```solidity
function totalSupply() external view returns (uint256)
```

_Returns the amount of tokens in existence._

### balanceOf

```solidity
function balanceOf(address account) external view returns (uint256)
```

_Returns the amount of tokens owned by `account`._

### transfer

```solidity
function transfer(address to, uint256 amount) external returns (bool)
```

_Moves `amount` tokens from the caller's account to `to`.

Returns a boolean value indicating whether the operation succeeded.

Emits a {Transfer} event._

### allowance

```solidity
function allowance(address owner, address spender) external view returns (uint256)
```

_Returns the remaining number of tokens that `spender` will be
allowed to spend on behalf of `owner` through {transferFrom}. This is
zero by default.

This value changes when {approve} or {transferFrom} are called._

### approve

```solidity
function approve(address spender, uint256 amount) external returns (bool)
```

_Sets `amount` as the allowance of `spender` over the caller's tokens.

Returns a boolean value indicating whether the operation succeeded.

IMPORTANT: Beware that changing an allowance with this method brings the risk
that someone may use both the old and the new allowance by unfortunate
transaction ordering. One possible solution to mitigate this race
condition is to first reduce the spender's allowance to 0 and set the
desired value afterwards:
https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729

Emits an {Approval} event._

### transferFrom

```solidity
function transferFrom(address from, address to, uint256 amount) external returns (bool)
```

_Moves `amount` tokens from `from` to `to` using the
allowance mechanism. `amount` is then deducted from the caller's
allowance.

Returns a boolean value indicating whether the operation succeeded.

Emits a {Transfer} event._

### Transfer

```solidity
event Transfer(address from, address to, uint256 value)
```

_Emitted when `value` tokens are moved from one account (`from`) to
another (`to`).

Note that `value` may be zero._

### Approval

```solidity
event Approval(address owner, address spender, uint256 value)
```

_Emitted when the allowance of a `spender` for an `owner` is set by
a call to {approve}. `value` is the new allowance._

## IERC20Metadata

_Interface for the optional metadata functions from the ERC20 standard.

_Available since v4.1.__

### name

```solidity
function name() external view returns (string)
```

_Returns the name of the token._

### symbol

```solidity
function symbol() external view returns (string)
```

_Returns the symbol of the token._

### decimals

```solidity
function decimals() external view returns (uint8)
```

_Returns the decimals places of the token._

## SafeERC20

_Wrappers around ERC20 operations that throw on failure (when the token
contract returns false). Tokens that return no value (and instead revert or
throw on failure) are also supported, non-reverting calls are assumed to be
successful.
To use this library you can add a `using SafeERC20 for IERC20;` statement to your contract,
which allows you to call the safe operations as `token.safeTransfer(...)`, etc._

### safeTransfer

```solidity
function safeTransfer(contract IERC20 token, address to, uint256 value) internal
```

### safeTransferFrom

```solidity
function safeTransferFrom(contract IERC20 token, address from, address to, uint256 value) internal
```

### safeApprove

```solidity
function safeApprove(contract IERC20 token, address spender, uint256 value) internal
```

_Deprecated. This function has issues similar to the ones found in
{IERC20-approve}, and its usage is discouraged.

Whenever possible, use {safeIncreaseAllowance} and
{safeDecreaseAllowance} instead._

### safeIncreaseAllowance

```solidity
function safeIncreaseAllowance(contract IERC20 token, address spender, uint256 value) internal
```

### safeDecreaseAllowance

```solidity
function safeDecreaseAllowance(contract IERC20 token, address spender, uint256 value) internal
```

### _callOptionalReturn

```solidity
function _callOptionalReturn(contract IERC20 token, bytes data) private
```

_Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
on the return value: the return value is optional (but if data is returned, it must not be false)._

| Name | Type | Description |
| ---- | ---- | ----------- |
| token | contract IERC20 | The token targeted by the call. |
| data | bytes | The call data (encoded using abi.encode or one of its variants). |

## Address

_Collection of functions related to the address type_

### isContract

```solidity
function isContract(address account) internal view returns (bool)
```

_Returns true if `account` is a contract.

[IMPORTANT]
====
It is unsafe to assume that an address for which this function returns
false is an externally-owned account (EOA) and not a contract.

Among others, `isContract` will return false for the following
types of addresses:

 - an externally-owned account
 - a contract in construction
 - an address where a contract will be created
 - an address where a contract lived, but was destroyed
====

[IMPORTANT]
====
You shouldn't rely on `isContract` to protect against flash loan attacks!

Preventing calls from contracts is highly discouraged. It breaks composability, breaks support for smart wallets
like Gnosis Safe, and does not provide security since it can be circumvented by calling from a contract
constructor.
====_

### sendValue

```solidity
function sendValue(address payable recipient, uint256 amount) internal
```

_Replacement for Solidity's `transfer`: sends `amount` wei to
`recipient`, forwarding all available gas and reverting on errors.

https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
of certain opcodes, possibly making contracts go over the 2300 gas limit
imposed by `transfer`, making them unable to receive funds via
`transfer`. {sendValue} removes this limitation.

https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].

IMPORTANT: because control is transferred to `recipient`, care must be
taken to not create reentrancy vulnerabilities. Consider using
{ReentrancyGuard} or the
https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern]._

### functionCall

```solidity
function functionCall(address target, bytes data) internal returns (bytes)
```

_Performs a Solidity function call using a low level `call`. A
plain `call` is an unsafe replacement for a function call: use this
function instead.

If `target` reverts with a revert reason, it is bubbled up by this
function (like regular Solidity function calls).

Returns the raw returned data. To convert to the expected return value,
use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].

Requirements:

- `target` must be a contract.
- calling `target` with `data` must not revert.

_Available since v3.1.__

### functionCall

```solidity
function functionCall(address target, bytes data, string errorMessage) internal returns (bytes)
```

_Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
`errorMessage` as a fallback revert reason when `target` reverts.

_Available since v3.1.__

### functionCallWithValue

```solidity
function functionCallWithValue(address target, bytes data, uint256 value) internal returns (bytes)
```

_Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
but also transferring `value` wei to `target`.

Requirements:

- the calling contract must have an ETH balance of at least `value`.
- the called Solidity function must be `payable`.

_Available since v3.1.__

### functionCallWithValue

```solidity
function functionCallWithValue(address target, bytes data, uint256 value, string errorMessage) internal returns (bytes)
```

_Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
with `errorMessage` as a fallback revert reason when `target` reverts.

_Available since v3.1.__

### functionStaticCall

```solidity
function functionStaticCall(address target, bytes data) internal view returns (bytes)
```

_Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
but performing a static call.

_Available since v3.3.__

### functionStaticCall

```solidity
function functionStaticCall(address target, bytes data, string errorMessage) internal view returns (bytes)
```

_Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
but performing a static call.

_Available since v3.3.__

### functionDelegateCall

```solidity
function functionDelegateCall(address target, bytes data) internal returns (bytes)
```

_Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
but performing a delegate call.

_Available since v3.4.__

### functionDelegateCall

```solidity
function functionDelegateCall(address target, bytes data, string errorMessage) internal returns (bytes)
```

_Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
but performing a delegate call.

_Available since v3.4.__

### verifyCallResult

```solidity
function verifyCallResult(bool success, bytes returndata, string errorMessage) internal pure returns (bytes)
```

_Tool to verifies that a low level call was successful, and revert if it wasn't, either by bubbling the
revert reason using the provided one.

_Available since v4.3.__

## Context

_Provides information about the current execution context, including the
sender of the transaction and its data. While these are generally available
via msg.sender and msg.data, they should not be accessed in such a direct
manner, since when dealing with meta-transactions the account sending and
paying for execution may not be the actual sender (as far as an application
is concerned).

This contract is only required for intermediate, library-like contracts._

### _msgSender

```solidity
function _msgSender() internal view virtual returns (address)
```

### _msgData

```solidity
function _msgData() internal view virtual returns (bytes)
```

## Strings

_String operations._

### _HEX_SYMBOLS

```solidity
bytes16 _HEX_SYMBOLS
```

### toString

```solidity
function toString(uint256 value) internal pure returns (string)
```

_Converts a `uint256` to its ASCII `string` decimal representation._

### toHexString

```solidity
function toHexString(uint256 value) internal pure returns (string)
```

_Converts a `uint256` to its ASCII `string` hexadecimal representation._

### toHexString

```solidity
function toHexString(uint256 value, uint256 length) internal pure returns (string)
```

_Converts a `uint256` to its ASCII `string` hexadecimal representation with fixed length._

## ERC165

_Implementation of the {IERC165} interface.

Contracts that want to implement ERC165 should inherit from this contract and override {supportsInterface} to check
for the additional interface id that will be supported. For example:

```solidity
function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
    return interfaceId == type(MyInterface).interfaceId || super.supportsInterface(interfaceId);
}
```

Alternatively, {ERC165Storage} provides an easier to use but more expensive implementation._

### supportsInterface

```solidity
function supportsInterface(bytes4 interfaceId) public view virtual returns (bool)
```

_See {IERC165-supportsInterface}._

## IERC165

_Interface of the ERC165 standard, as defined in the
https://eips.ethereum.org/EIPS/eip-165[EIP].

Implementers can declare support of contract interfaces, which can then be
queried by others ({ERC165Checker}).

For an implementation, see {ERC165}._

### supportsInterface

```solidity
function supportsInterface(bytes4 interfaceId) external view returns (bool)
```

_Returns true if this contract implements the interface defined by
`interfaceId`. See the corresponding
https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
to learn more about how these ids are created.

This function call must use less than 30 000 gas._

## WAVault

### token_vault

```solidity
address token_vault
```

### MANAGED_ASSET

```solidity
address MANAGED_ASSET
```

### _vaultBalance

```solidity
uint256 _vaultBalance
```

### _initialRatio

```solidity
uint256 _initialRatio
```

### AAVE_LENDING_POOL

```solidity
address AAVE_LENDING_POOL
```

### AAVE_INCENTIVES_CONTROLLER

```solidity
address AAVE_INCENTIVES_CONTROLLER
```

### AAVE_DATA_PROVIDER

```solidity
address AAVE_DATA_PROVIDER
```

### EXCHANGE_SELECTED

```solidity
address EXCHANGE_SELECTED
```

### DepositAsset

```solidity
event DepositAsset(address _asset, address _owner, uint256 _amount)
```

### WithdrawAsset

```solidity
event WithdrawAsset(address _asset, address _owner, uint256 _amount)
```

### RewardClaimed

```solidity
event RewardClaimed(address _asset, uint256 _amount)
```

### TokenSwapped

```solidity
event TokenSwapped(address _from, address _to)
```

### RewardHarvested

```solidity
event RewardHarvested(address _asset, uint256 _amount)
```

### BalanceUpdated

```solidity
event BalanceUpdated(uint256 _vaultBalance)
```

### VaultTokenCreated

```solidity
event VaultTokenCreated(address token_address)
```

### constructor

```solidity
constructor(address admin, address managed_asset, uint256 initialRatio, string tokenName, string tokenSymbol) public
```

| Name | Type | Description |
| ---- | ---- | ----------- |
| admin | address | The address of the multi-sig wallet to manage the vault. |
| managed_asset | address | The address of unique the asset managed by this vault. |
| initialRatio | uint256 | The amount based on 1000 basis points to mint tokens in the first deposit. |
| tokenName | string | The name of the ERC20 Token of the vault. |
| tokenSymbol | string | The symbol of the ERC20 Token of the vault. |

### setExchange

```solidity
function setExchange(address exchange_address) external
```

Set the exchange to swap the tokens after collect the rewards.

NOTE: The exchange needs to have the contracts based on UniswapV2.

| Name | Type | Description |
| ---- | ---- | ----------- |
| exchange_address | address | The address of the exchange Router contract. |

### setAaveSettings

```solidity
function setAaveSettings(address _AAVE_DATA_PROVIDER, address _AAVE_INCENTIVES_CONTROLLER, address _AAVE_LENDING_POOL) external
```

# Set the core address of Aave to be used by the vault.

| Name | Type | Description |
| ---- | ---- | ----------- |
| _AAVE_DATA_PROVIDER | address | The address of the Data Provider contract of Aave. |
| _AAVE_INCENTIVES_CONTROLLER | address | The address of the Incentives Controller of Aave. |
| _AAVE_LENDING_POOL | address | The address of the main contract of Aave. |

### getVaultToken

```solidity
function getVaultToken() public view returns (address)
```

### getUSDBalance

```solidity
function getUSDBalance() public view returns (uint256)
```

### getUSDBalance

```solidity
function getUSDBalance(address _user) public view returns (uint256)
```

### getAssetBalance

```solidity
function getAssetBalance(address _asset) private view returns (uint256)
```

### vaultBalance

```solidity
function vaultBalance() public view returns (uint256)
```

### getPrice

```solidity
function getPrice() public view returns (uint256)
```

# Calculate and return the current price of the WindotToken for the Vault.

NOTE: The current TVL in USD on the vault is stored at variable `_vaultBalance`.

* The usual way to do this is divide the TVL directly by the current supply of WindowVaultTokens but this will result in a very small number so we need to first elevate the `_vaultBalance` by 10 and just then divide by the price.

$\displaystyle price = \frac {vaultBalance * 10^{10}}{vaultSupply} $

### getAavebalance

```solidity
function getAavebalance() public view returns (uint256)
```

### _vaultSupply

```solidity
function _vaultSupply() internal view returns (uint256)
```

### getRewardBalance

```solidity
function getRewardBalance(address _asset) private view returns (uint256)
```

### _amountInUSD

```solidity
function _amountInUSD(uint256 amount, address asset, bool isStableAsset) internal view returns (uint256)
```

# Receive an amount in ERC20 tokens and calculate the respective amount in USD dollars with 8 decimals
The first step is consult the decimals of the current asset.

If the `difference` is `greater` than 8:

$\displaystyle amount = \frac {amount}{10^{difference}} $

If the `difference` is `lower` than 8:

$\displaystyle amount = amount * 10^{difference} $

_In the case when the asset `is not a stablecoin` the price will be obtained using chainlink oracles and they come with a default of 8 decimals.

NOTE: To obtain the amount in USD we need to multiply the amount by the price. The result will have 18 decimals and to obtain a final number with 8 decimals we need to divide by the differce which is 10.

$ \displaystyle amount = \frac {price * amount}{10^{10}} $._

| Name | Type | Description |
| ---- | ---- | ----------- |
| amount | uint256 | The original amount in the current asset. |
| asset | address | The address of the asset |
| isStableAsset | bool | `true` if the asset is an stablecoin or `false` otherwise. |

### _increaseBalance

```solidity
function _increaseBalance(uint256 amount) private
```

Update the vault Balance in USD after depoisits and harvesting.

| Name | Type | Description |
| ---- | ---- | ----------- |
| amount | uint256 | The amount to be additioned to the vault Balance. |

### _decreaseBalance

```solidity
function _decreaseBalance(uint256 amount) private
```

Update the vault Balance in USD after withdraws.

| Name | Type | Description |
| ---- | ---- | ----------- |
| amount | uint256 | The amount to be removed from the vault Balance. |

### deposit

```solidity
function deposit(uint256 amount, address _asset, bool isStableAsset, uint256 slippage) external
```

# Deposit money in the Vault.

_NOTE: The asset being depoist needs to be the same as the managed asset by the Vault and have greater ow equivalent allowance.

If the funds could be moved to the vault th `mintVault()` will min the WindowVaultTokens to the user's address and proceed with the `depositToAave()`._

| Name | Type | Description |
| ---- | ---- | ----------- |
| amount | uint256 | The amount of the deposit. |
| _asset | address | The address of the asset being deposited. |
| isStableAsset | bool | Bool value with `true` for stablecoins or `false` otherwise. |
| slippage | uint256 | The acceptable slippage. |

### withdraw

```solidity
function withdraw(uint256 amount, address _asset, bool isStableAsset, uint256 slippage) external
```

/**
# Withdraw money from the vault by the user.

_The first step is calculate the amount in USD of the request and then calculate the amount in WindowVaultTokens needed to burn after the request. If the user has enough funds to redeem the request will proceed.
* The function `withdrawFromAave()` will be called and the WindowVaultTokens will be burned from the user address.ß
/_

| Name | Type | Description |
| ---- | ---- | ----------- |
| amount | uint256 | The amount requested to redeem. |
| _asset | address | The address of the disered asset. |
| isStableAsset | bool | Bool value with `true` for stablecoins or `false` otherwise. |
| slippage | uint256 | The acceptable slippage. |

### _amountInTokens

```solidity
function _amountInTokens(uint256 amount) internal view returns (uint256)
```

*
# Calculate and return the equivalent amount of WindowVault Tokens for a given USD input amount.

NOTE: The function `getPrice()` will return the current WindowVault Token price in USD with 8 decimals.

* The usual way to do this is divide the amount by the price but this will result in a very small number so we need to first elevate or initial amount by 10 and just then divide by the price.

$\displaystyle amountInTokens = \frac {amount * 10^{10}}{price} $
/

| Name | Type | Description |
| ---- | ---- | ----------- |
| amount | uint256 | The USD amount in 8 decimals. |

### burnVault

```solidity
function burnVault(uint256 amount, address user) private
```

*
Burn Window Vault Tokens after withdraws.
/

| Name | Type | Description |
| ---- | ---- | ----------- |
| amount | uint256 | The amount of tokens to be burned. |
| user | address | The address of the user to burn the tokens. |

### mintVault

```solidity
function mintVault(address user, uint256 amount) private
```

*
# Mint the WindowVaultTokens for the user after deposits.
NOTE: In the first deposit the Tokens doesn't have price so the creation will be based in a initial ratio of calculated using 1000 basis points.
$\displaystyle firstMintAmount = \frac {amount}{1000} * initialRatio $

/

| Name | Type | Description |
| ---- | ---- | ----------- |
| user | address | The address of the user. |
| amount | uint256 | The amount in USD to be minted. |

### depositToAave

```solidity
function depositToAave(address _asset, uint256 _amount) private
```

### withdrawFromAave

```solidity
function withdrawFromAave(address _asset, uint256 _amount, address _to) private
```

### claimRewardsFromAAve

```solidity
function claimRewardsFromAAve(address _asset, uint256 _amount) private
```

### swapRewards

```solidity
function swapRewards(address _asset, address _swapTo, uint256 _amount) private returns (bool sucesseds)
```

### harvest

```solidity
function harvest(address _asset, address _swapTo) external returns (bool)
```

### _harvest

```solidity
function _harvest(address _asset, address _swapTo) private
```

### panic

```solidity
function panic(address _asset, bool pause) external
```

## WBVault

### pool_id

```solidity
bytes32 pool_id
```

### pool_address

```solidity
address pool_address
```

### _initialRatio

```solidity
uint256 _initialRatio
```

### token_vault

```solidity
address token_vault
```

### BalancerVault

```solidity
address BalancerVault
```

### BalancerHelper

```solidity
address BalancerHelper
```

### BalancerPoolGauge

```solidity
address BalancerPoolGauge
```

### BalancerRewardToken

```solidity
address BalancerRewardToken
```

### PoolToSwapRewards

```solidity
bytes32 PoolToSwapRewards
```

### AssetToHarvest

```solidity
address AssetToHarvest
```

### HarvestAssetStable

```solidity
bool HarvestAssetStable
```

### JOIN_KIND

```solidity
uint256 JOIN_KIND
```

### _vaultBalance

```solidity
uint256 _vaultBalance
```

### DepositAsset

```solidity
event DepositAsset(address _asset, address _owner, uint256 _amount)
```

### WithdrawAsset

```solidity
event WithdrawAsset(address _asset, address _owner, uint256 _amount)
```

### RewardClaimed

```solidity
event RewardClaimed(address _asset, uint256 _amount)
```

### TokenSwapped

```solidity
event TokenSwapped(address _from, address _to)
```

### RewardHarvested

```solidity
event RewardHarvested(address _asset, uint256 _amount)
```

### BalanceUpdated

```solidity
event BalanceUpdated(uint256 _vaultBalance)
```

### constructor

```solidity
constructor(string tokenName, string tokenSymbol, address poolAddress, bytes32 poolID, uint256 initialRatio) public
```

### setBalancerSettings

```solidity
function setBalancerSettings(address _balancerVault, address _balancerHelper, address _balancerGauge, address _balancerRewardToken, bytes32 _poolToSwapRewards, address _assetToHarvest, bool _harvestAssetStable) external
```

### getBPTBalance

```solidity
function getBPTBalance() public view returns (uint256)
```

### _getTokenIndex

```solidity
function _getTokenIndex(address[] tokens, address _asset) internal pure returns (uint256 i)
```

### _getTokens

```solidity
function _getTokens() internal view returns (address[] assets)
```

### _getExactBPTAmount

```solidity
function _getExactBPTAmount(address[] assets, uint256[] amounts) internal returns (uint256)
```

### _getMinTokenAmount

```solidity
function _getMinTokenAmount(uint256 initialTokenAmount, uint256 slippage) internal pure returns (uint256)
```

### _getMaxTokenAmount

```solidity
function _getMaxTokenAmount(uint256 initialTokenAmount, uint256 slippage) internal pure returns (uint256)
```

### _depositOnPool

```solidity
function _depositOnPool(uint256 _depositAmount, address _asset, uint256 slippage) internal
```

### _withdrawFromPool

```solidity
function _withdrawFromPool(uint256 withdraw_bpt_amount, address _asset, uint256 amount, uint256 slippage, address recipient) internal
```

### _amountInUSD

```solidity
function _amountInUSD(uint256 _amount, address asset, bool isStableAsset) internal view returns (uint256)
```

### _increaseBalance

```solidity
function _increaseBalance(uint256 _amount) private
```

### _decreaseBalance

```solidity
function _decreaseBalance(uint256 _amount) private
```

### vaultBalance

```solidity
function vaultBalance() public view returns (uint256)
```

### _vaultSupply

```solidity
function _vaultSupply() internal view returns (uint256)
```

### _amountInTokens

```solidity
function _amountInTokens(uint256 _amount) internal view returns (uint256)
```

### mintVault

```solidity
function mintVault(address _onBehalfOf, uint256 _amount) private
```

### burnVault

```solidity
function burnVault(uint256 _amount, address user) private
```

### deposit

```solidity
function deposit(uint256 _amount, address _asset, bool isStableAsset, uint256 slippage) public
```

### getAssetBalance

```solidity
function getAssetBalance(address _asset) public view returns (uint256)
```

### getPrice

```solidity
function getPrice() public view returns (uint256)
```

### withdraw

```solidity
function withdraw(uint256 _amount, address _asset, bool isStableAsset, uint256 slippage) public
```

### _swapTokens

```solidity
function _swapTokens(address _assetIn, address _assetOut, uint256 _amount) internal
```

### harvest

```solidity
function harvest() external
```

### getVaultToken

```solidity
function getVaultToken() public view returns (address)
```

## Swappable

### SWAP_PRECISION

```solidity
uint256 SWAP_PRECISION
```

### RATIO_PRECISION

```solidity
uint256 RATIO_PRECISION
```

### swapSlippageRatio

```solidity
uint256 swapSlippageRatio
```

### oracles

```solidity
mapping(address => contract IChainLink) oracles
```

### maxPriceOffset

```solidity
uint256 maxPriceOffset
```

### setSwapSlippageRatio

```solidity
function setSwapSlippageRatio(uint256 _ratio) external
```

### setMaxPriceOffset

```solidity
function setMaxPriceOffset(uint256 _offset) external
```

### setPriceFeed

```solidity
function setPriceFeed(address _token, contract IChainLink _feed) external
```

### _expectedForSwap

```solidity
function _expectedForSwap(uint256 _amount, address _fromToken, address _toToken) internal view returns (uint256)
```

### _getPriceFor

```solidity
function _getPriceFor(address _token) internal view returns (uint256)
```

## IAaveIncentivesController

### claimRewards

```solidity
function claimRewards(address[] assets, uint256 amount, address to) external returns (uint256)
```

## IAsset

_This is an empty interface used to represent either ERC20-conforming token contracts or ETH (using the zero
address sentinel value). We're just relying on the fact that `interface` can be used to declare new address-like
types.

This concept is unrelated to a Pool's Asset Managers._

## IBalancerV2Vault

### queryJoin

```solidity
function queryJoin(bytes32 poolId, address sender, address recipient, struct IBalancerV2Vault.JoinPoolRequest request) external returns (uint256 bptOut, uint256[] amountsIn)
```

### joinPool

```solidity
function joinPool(bytes32 poolId, address sender, address recipient, struct IBalancerV2Vault.JoinPoolRequest request) external payable
```

### JoinPoolRequest

```solidity
struct JoinPoolRequest {
  address[] assets;
  uint256[] maxAmountsIn;
  bytes userData;
  bool fromInternalBalance;
}
```

### exitPool

```solidity
function exitPool(bytes32 poolId, address sender, address recipient, struct IBalancerV2Vault.ExitPoolRequest request) external
```

### ExitPoolRequest

```solidity
struct ExitPoolRequest {
  address[] assets;
  uint256[] minAmountsOut;
  bytes userData;
  bool toInternalBalance;
}
```

### getPoolTokens

```solidity
function getPoolTokens(bytes32 poolId) external view returns (contract IERC20[] tokens, uint256[] balances, uint256 lastChangeBlock)
```

### getPool

```solidity
function getPool(bytes32 poolId) external view returns (address, uint8)
```

## IBalancerPool

### getRate

```solidity
function getRate() external view returns (uint256)
```

### getSwapFeePercentage

```solidity
function getSwapFeePercentage() external view returns (uint256)
```

## BalancerV2Claim

```solidity
struct BalancerV2Claim {
  uint256 distributionId;
  uint256 balance;
  address distributor;
  uint256 tokenIndex;
  bytes32[] merkleProof;
}
```

## IPoolGauge

### claimable_reward

```solidity
function claimable_reward(address user, address token) external view returns (uint256)
```

### reward_tokens

```solidity
function reward_tokens(uint256 tokenIndex) external view returns (address)
```

### claim_rewards

```solidity
function claim_rewards() external
```

## IPoolSwap

### SwapKind

```solidity
enum SwapKind {
  GIVEN_IN,
  GIVEN_OUT
}
```

### SingleSwap

```solidity
struct SingleSwap {
  bytes32 poolId;
  enum IPoolSwap.SwapKind kind;
  contract IAsset assetIn;
  contract IAsset assetOut;
  uint256 amount;
  bytes userData;
}
```

### FundManagement

```solidity
struct FundManagement {
  address sender;
  bool fromInternalBalance;
  address payable recipient;
  bool toInternalBalance;
}
```

### swap

```solidity
function swap(struct IPoolSwap.SingleSwap singleSwap, struct IPoolSwap.FundManagement funds, uint256 limit, uint256 deadline) external payable returns (uint256)
```

## IChainLink

### latestRoundData

```solidity
function latestRoundData() external view returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound)
```

### decimals

```solidity
function decimals() external view returns (uint8)
```

### aggregator

```solidity
function aggregator() external view returns (address)
```

## IDataProvider

### getReserveTokensAddresses

```solidity
function getReserveTokensAddresses(address asset) external view returns (address aTokenAddress, address stableDebtTokenAddress, address variableDebtTokenAddress)
```

### getUserReserveData

```solidity
function getUserReserveData(address asset, address user) external view returns (uint256 currentATokenBalance, uint256 currentStableDebt, uint256 currentVariableDebt, uint256 principalStableDebt, uint256 scaledVariableDebt, uint256 stableBorrowRate, uint256 liquidityRate, uint40 stableRateLastUpdated, bool usageAsCollateralEnabled)
```

### getRewardsBalance

```solidity
function getRewardsBalance(address[] assets, address user) external view returns (uint256)
```

## ILendingPool

### Deposit

```solidity
event Deposit(address reserve, address user, address onBehalfOf, uint256 amount, uint16 referral)
```

### Withdraw

```solidity
event Withdraw(address reserve, address user, address to, uint256 amount)
```

### deposit

```solidity
function deposit(address asset, uint256 amount, address onBehalfOf, uint16 referralCode) external
```

### withdraw

```solidity
function withdraw(address asset, uint256 amount, address to) external returns (uint256)
```

### borrow

```solidity
function borrow(address asset, uint256 amount, uint256 interestRateMode, uint16 referralCode, address onBehalfOf) external
```

### repay

```solidity
function repay(address asset, uint256 amount, uint256 rateMode, address onBehalfOf) external returns (uint256)
```

### getUserAccountData

```solidity
function getUserAccountData(address user) external view returns (uint256 totalCollateralETH, uint256 totalDebtETH, uint256 availableBorrowsETH, uint256 currentLiquidationThreshold, uint256 ltv, uint256 healthFactor)
```

## IUniswapRouter

### swapExactTokensForTokens

```solidity
function swapExactTokensForTokens(uint256 amountIn, uint256 amountOutMin, address[] path, address to, uint256 deadline) external returns (uint256[] amounts)
```

### addLiquidity

```solidity
function addLiquidity(address tokenA, address tokenB, uint256 amountADesired, uint256 amountBDesired, uint256 amountAMin, uint256 amountBMin, address to, uint256 deadline) external returns (uint256 amountA, uint256 amountB, uint256 liquidity)
```

### removeLiquidity

```solidity
function removeLiquidity(address tokenA, address tokenB, uint256 liquidity, uint256 amountAMin, uint256 amountBMin, address to, uint256 deadline) external returns (uint256 amountA, uint256 amountB)
```

### removeLiquidityETH

```solidity
function removeLiquidityETH(address token, uint256 liquidity, uint256 amountTokenMin, uint256 amountETHMin, address to, uint256 deadline) external returns (uint256 amountToken, uint256 amountETH)
```

### getAmountsOut

```solidity
function getAmountsOut(uint256 amountIn, address[] path) external view returns (uint256[] amounts)
```

## IWToken

### mint

```solidity
function mint(address account, uint256 amount) external
```

### burn

```solidity
function burn(address account, uint256 amount) external
```

## WVaultToken

### constructor

```solidity
constructor(string _name, string _symbol) public
```

### mint

```solidity
function mint(address account, uint256 amount) external
```

### burn

```solidity
function burn(address account, uint256 amount) external
```

### decimals

```solidity
function decimals() public view returns (uint8)
```

_Returns the number of decimals used to get its user representation.
For example, if `decimals` equals `2`, a balance of `505` tokens should
be displayed to a user as `5.05` (`505 / 10 ** 2`).

Tokens usually opt for a value of 18, imitating the relationship between
Ether and Wei. This is the value {ERC20} uses, unless this function is
overridden;

NOTE: This information is only used for _display_ purposes: it in
no way affects any of the arithmetic of the contract, including
{IERC20-balanceOf} and {IERC20-transfer}._

## WinAdmin

### CONTRACT_AUTH

```solidity
bytes32 CONTRACT_AUTH
```

### NewAdminAdded

```solidity
event NewAdminAdded(address new_admin)
```

### NewAuthorizedContractAdded

```solidity
event NewAuthorizedContractAdded(address new_authorized_contract)
```

### RemovedAdmin

```solidity
event RemovedAdmin(address removed_admin)
```

### RemovedAuthorizedContract

```solidity
event RemovedAuthorizedContract(address removed_authorized_contract)
```

### constructor

```solidity
constructor(address admin) public
```

### onlyAdmin

```solidity
modifier onlyAdmin()
```

### onlyAuthorizedContract

```solidity
modifier onlyAuthorizedContract()
```

### addAdmin

```solidity
function addAdmin(address account) external
```

### removeAdmin

```solidity
function removeAdmin(address account) external
```

### pause

```solidity
function pause() external
```

### unpause

```solidity
function unpause() external
```

### addAuthorizedContract

```solidity
function addAuthorizedContract(address _contract) external
```

### removeAuthorizedContract

```solidity
function removeAuthorizedContract(address _contract) external
```

## console

### CONSOLE_ADDRESS

```solidity
address CONSOLE_ADDRESS
```

### _sendLogPayload

```solidity
function _sendLogPayload(bytes payload) private view
```

### log

```solidity
function log() internal view
```

### logInt

```solidity
function logInt(int256 p0) internal view
```

### logUint

```solidity
function logUint(uint256 p0) internal view
```

### logString

```solidity
function logString(string p0) internal view
```

### logBool

```solidity
function logBool(bool p0) internal view
```

### logAddress

```solidity
function logAddress(address p0) internal view
```

### logBytes

```solidity
function logBytes(bytes p0) internal view
```

### logBytes1

```solidity
function logBytes1(bytes1 p0) internal view
```

### logBytes2

```solidity
function logBytes2(bytes2 p0) internal view
```

### logBytes3

```solidity
function logBytes3(bytes3 p0) internal view
```

### logBytes4

```solidity
function logBytes4(bytes4 p0) internal view
```

### logBytes5

```solidity
function logBytes5(bytes5 p0) internal view
```

### logBytes6

```solidity
function logBytes6(bytes6 p0) internal view
```

### logBytes7

```solidity
function logBytes7(bytes7 p0) internal view
```

### logBytes8

```solidity
function logBytes8(bytes8 p0) internal view
```

### logBytes9

```solidity
function logBytes9(bytes9 p0) internal view
```

### logBytes10

```solidity
function logBytes10(bytes10 p0) internal view
```

### logBytes11

```solidity
function logBytes11(bytes11 p0) internal view
```

### logBytes12

```solidity
function logBytes12(bytes12 p0) internal view
```

### logBytes13

```solidity
function logBytes13(bytes13 p0) internal view
```

### logBytes14

```solidity
function logBytes14(bytes14 p0) internal view
```

### logBytes15

```solidity
function logBytes15(bytes15 p0) internal view
```

### logBytes16

```solidity
function logBytes16(bytes16 p0) internal view
```

### logBytes17

```solidity
function logBytes17(bytes17 p0) internal view
```

### logBytes18

```solidity
function logBytes18(bytes18 p0) internal view
```

### logBytes19

```solidity
function logBytes19(bytes19 p0) internal view
```

### logBytes20

```solidity
function logBytes20(bytes20 p0) internal view
```

### logBytes21

```solidity
function logBytes21(bytes21 p0) internal view
```

### logBytes22

```solidity
function logBytes22(bytes22 p0) internal view
```

### logBytes23

```solidity
function logBytes23(bytes23 p0) internal view
```

### logBytes24

```solidity
function logBytes24(bytes24 p0) internal view
```

### logBytes25

```solidity
function logBytes25(bytes25 p0) internal view
```

### logBytes26

```solidity
function logBytes26(bytes26 p0) internal view
```

### logBytes27

```solidity
function logBytes27(bytes27 p0) internal view
```

### logBytes28

```solidity
function logBytes28(bytes28 p0) internal view
```

### logBytes29

```solidity
function logBytes29(bytes29 p0) internal view
```

### logBytes30

```solidity
function logBytes30(bytes30 p0) internal view
```

### logBytes31

```solidity
function logBytes31(bytes31 p0) internal view
```

### logBytes32

```solidity
function logBytes32(bytes32 p0) internal view
```

### log

```solidity
function log(uint256 p0) internal view
```

### log

```solidity
function log(string p0) internal view
```

### log

```solidity
function log(bool p0) internal view
```

### log

```solidity
function log(address p0) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1) internal view
```

### log

```solidity
function log(uint256 p0, string p1) internal view
```

### log

```solidity
function log(uint256 p0, bool p1) internal view
```

### log

```solidity
function log(uint256 p0, address p1) internal view
```

### log

```solidity
function log(string p0, uint256 p1) internal view
```

### log

```solidity
function log(string p0, string p1) internal view
```

### log

```solidity
function log(string p0, bool p1) internal view
```

### log

```solidity
function log(string p0, address p1) internal view
```

### log

```solidity
function log(bool p0, uint256 p1) internal view
```

### log

```solidity
function log(bool p0, string p1) internal view
```

### log

```solidity
function log(bool p0, bool p1) internal view
```

### log

```solidity
function log(bool p0, address p1) internal view
```

### log

```solidity
function log(address p0, uint256 p1) internal view
```

### log

```solidity
function log(address p0, string p1) internal view
```

### log

```solidity
function log(address p0, bool p1) internal view
```

### log

```solidity
function log(address p0, address p1) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1, uint256 p2) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1, string p2) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1, bool p2) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1, address p2) internal view
```

### log

```solidity
function log(uint256 p0, string p1, uint256 p2) internal view
```

### log

```solidity
function log(uint256 p0, string p1, string p2) internal view
```

### log

```solidity
function log(uint256 p0, string p1, bool p2) internal view
```

### log

```solidity
function log(uint256 p0, string p1, address p2) internal view
```

### log

```solidity
function log(uint256 p0, bool p1, uint256 p2) internal view
```

### log

```solidity
function log(uint256 p0, bool p1, string p2) internal view
```

### log

```solidity
function log(uint256 p0, bool p1, bool p2) internal view
```

### log

```solidity
function log(uint256 p0, bool p1, address p2) internal view
```

### log

```solidity
function log(uint256 p0, address p1, uint256 p2) internal view
```

### log

```solidity
function log(uint256 p0, address p1, string p2) internal view
```

### log

```solidity
function log(uint256 p0, address p1, bool p2) internal view
```

### log

```solidity
function log(uint256 p0, address p1, address p2) internal view
```

### log

```solidity
function log(string p0, uint256 p1, uint256 p2) internal view
```

### log

```solidity
function log(string p0, uint256 p1, string p2) internal view
```

### log

```solidity
function log(string p0, uint256 p1, bool p2) internal view
```

### log

```solidity
function log(string p0, uint256 p1, address p2) internal view
```

### log

```solidity
function log(string p0, string p1, uint256 p2) internal view
```

### log

```solidity
function log(string p0, string p1, string p2) internal view
```

### log

```solidity
function log(string p0, string p1, bool p2) internal view
```

### log

```solidity
function log(string p0, string p1, address p2) internal view
```

### log

```solidity
function log(string p0, bool p1, uint256 p2) internal view
```

### log

```solidity
function log(string p0, bool p1, string p2) internal view
```

### log

```solidity
function log(string p0, bool p1, bool p2) internal view
```

### log

```solidity
function log(string p0, bool p1, address p2) internal view
```

### log

```solidity
function log(string p0, address p1, uint256 p2) internal view
```

### log

```solidity
function log(string p0, address p1, string p2) internal view
```

### log

```solidity
function log(string p0, address p1, bool p2) internal view
```

### log

```solidity
function log(string p0, address p1, address p2) internal view
```

### log

```solidity
function log(bool p0, uint256 p1, uint256 p2) internal view
```

### log

```solidity
function log(bool p0, uint256 p1, string p2) internal view
```

### log

```solidity
function log(bool p0, uint256 p1, bool p2) internal view
```

### log

```solidity
function log(bool p0, uint256 p1, address p2) internal view
```

### log

```solidity
function log(bool p0, string p1, uint256 p2) internal view
```

### log

```solidity
function log(bool p0, string p1, string p2) internal view
```

### log

```solidity
function log(bool p0, string p1, bool p2) internal view
```

### log

```solidity
function log(bool p0, string p1, address p2) internal view
```

### log

```solidity
function log(bool p0, bool p1, uint256 p2) internal view
```

### log

```solidity
function log(bool p0, bool p1, string p2) internal view
```

### log

```solidity
function log(bool p0, bool p1, bool p2) internal view
```

### log

```solidity
function log(bool p0, bool p1, address p2) internal view
```

### log

```solidity
function log(bool p0, address p1, uint256 p2) internal view
```

### log

```solidity
function log(bool p0, address p1, string p2) internal view
```

### log

```solidity
function log(bool p0, address p1, bool p2) internal view
```

### log

```solidity
function log(bool p0, address p1, address p2) internal view
```

### log

```solidity
function log(address p0, uint256 p1, uint256 p2) internal view
```

### log

```solidity
function log(address p0, uint256 p1, string p2) internal view
```

### log

```solidity
function log(address p0, uint256 p1, bool p2) internal view
```

### log

```solidity
function log(address p0, uint256 p1, address p2) internal view
```

### log

```solidity
function log(address p0, string p1, uint256 p2) internal view
```

### log

```solidity
function log(address p0, string p1, string p2) internal view
```

### log

```solidity
function log(address p0, string p1, bool p2) internal view
```

### log

```solidity
function log(address p0, string p1, address p2) internal view
```

### log

```solidity
function log(address p0, bool p1, uint256 p2) internal view
```

### log

```solidity
function log(address p0, bool p1, string p2) internal view
```

### log

```solidity
function log(address p0, bool p1, bool p2) internal view
```

### log

```solidity
function log(address p0, bool p1, address p2) internal view
```

### log

```solidity
function log(address p0, address p1, uint256 p2) internal view
```

### log

```solidity
function log(address p0, address p1, string p2) internal view
```

### log

```solidity
function log(address p0, address p1, bool p2) internal view
```

### log

```solidity
function log(address p0, address p1, address p2) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1, uint256 p2, uint256 p3) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1, uint256 p2, string p3) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1, uint256 p2, bool p3) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1, uint256 p2, address p3) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1, string p2, uint256 p3) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1, string p2, string p3) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1, string p2, bool p3) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1, string p2, address p3) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1, bool p2, uint256 p3) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1, bool p2, string p3) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1, bool p2, bool p3) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1, bool p2, address p3) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1, address p2, uint256 p3) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1, address p2, string p3) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1, address p2, bool p3) internal view
```

### log

```solidity
function log(uint256 p0, uint256 p1, address p2, address p3) internal view
```

### log

```solidity
function log(uint256 p0, string p1, uint256 p2, uint256 p3) internal view
```

### log

```solidity
function log(uint256 p0, string p1, uint256 p2, string p3) internal view
```

### log

```solidity
function log(uint256 p0, string p1, uint256 p2, bool p3) internal view
```

### log

```solidity
function log(uint256 p0, string p1, uint256 p2, address p3) internal view
```

### log

```solidity
function log(uint256 p0, string p1, string p2, uint256 p3) internal view
```

### log

```solidity
function log(uint256 p0, string p1, string p2, string p3) internal view
```

### log

```solidity
function log(uint256 p0, string p1, string p2, bool p3) internal view
```

### log

```solidity
function log(uint256 p0, string p1, string p2, address p3) internal view
```

### log

```solidity
function log(uint256 p0, string p1, bool p2, uint256 p3) internal view
```

### log

```solidity
function log(uint256 p0, string p1, bool p2, string p3) internal view
```

### log

```solidity
function log(uint256 p0, string p1, bool p2, bool p3) internal view
```

### log

```solidity
function log(uint256 p0, string p1, bool p2, address p3) internal view
```

### log

```solidity
function log(uint256 p0, string p1, address p2, uint256 p3) internal view
```

### log

```solidity
function log(uint256 p0, string p1, address p2, string p3) internal view
```

### log

```solidity
function log(uint256 p0, string p1, address p2, bool p3) internal view
```

### log

```solidity
function log(uint256 p0, string p1, address p2, address p3) internal view
```

### log

```solidity
function log(uint256 p0, bool p1, uint256 p2, uint256 p3) internal view
```

### log

```solidity
function log(uint256 p0, bool p1, uint256 p2, string p3) internal view
```

### log

```solidity
function log(uint256 p0, bool p1, uint256 p2, bool p3) internal view
```

### log

```solidity
function log(uint256 p0, bool p1, uint256 p2, address p3) internal view
```

### log

```solidity
function log(uint256 p0, bool p1, string p2, uint256 p3) internal view
```

### log

```solidity
function log(uint256 p0, bool p1, string p2, string p3) internal view
```

### log

```solidity
function log(uint256 p0, bool p1, string p2, bool p3) internal view
```

### log

```solidity
function log(uint256 p0, bool p1, string p2, address p3) internal view
```

### log

```solidity
function log(uint256 p0, bool p1, bool p2, uint256 p3) internal view
```

### log

```solidity
function log(uint256 p0, bool p1, bool p2, string p3) internal view
```

### log

```solidity
function log(uint256 p0, bool p1, bool p2, bool p3) internal view
```

### log

```solidity
function log(uint256 p0, bool p1, bool p2, address p3) internal view
```

### log

```solidity
function log(uint256 p0, bool p1, address p2, uint256 p3) internal view
```

### log

```solidity
function log(uint256 p0, bool p1, address p2, string p3) internal view
```

### log

```solidity
function log(uint256 p0, bool p1, address p2, bool p3) internal view
```

### log

```solidity
function log(uint256 p0, bool p1, address p2, address p3) internal view
```

### log

```solidity
function log(uint256 p0, address p1, uint256 p2, uint256 p3) internal view
```

### log

```solidity
function log(uint256 p0, address p1, uint256 p2, string p3) internal view
```

### log

```solidity
function log(uint256 p0, address p1, uint256 p2, bool p3) internal view
```

### log

```solidity
function log(uint256 p0, address p1, uint256 p2, address p3) internal view
```

### log

```solidity
function log(uint256 p0, address p1, string p2, uint256 p3) internal view
```

### log

```solidity
function log(uint256 p0, address p1, string p2, string p3) internal view
```

### log

```solidity
function log(uint256 p0, address p1, string p2, bool p3) internal view
```

### log

```solidity
function log(uint256 p0, address p1, string p2, address p3) internal view
```

### log

```solidity
function log(uint256 p0, address p1, bool p2, uint256 p3) internal view
```

### log

```solidity
function log(uint256 p0, address p1, bool p2, string p3) internal view
```

### log

```solidity
function log(uint256 p0, address p1, bool p2, bool p3) internal view
```

### log

```solidity
function log(uint256 p0, address p1, bool p2, address p3) internal view
```

### log

```solidity
function log(uint256 p0, address p1, address p2, uint256 p3) internal view
```

### log

```solidity
function log(uint256 p0, address p1, address p2, string p3) internal view
```

### log

```solidity
function log(uint256 p0, address p1, address p2, bool p3) internal view
```

### log

```solidity
function log(uint256 p0, address p1, address p2, address p3) internal view
```

### log

```solidity
function log(string p0, uint256 p1, uint256 p2, uint256 p3) internal view
```

### log

```solidity
function log(string p0, uint256 p1, uint256 p2, string p3) internal view
```

### log

```solidity
function log(string p0, uint256 p1, uint256 p2, bool p3) internal view
```

### log

```solidity
function log(string p0, uint256 p1, uint256 p2, address p3) internal view
```

### log

```solidity
function log(string p0, uint256 p1, string p2, uint256 p3) internal view
```

### log

```solidity
function log(string p0, uint256 p1, string p2, string p3) internal view
```

### log

```solidity
function log(string p0, uint256 p1, string p2, bool p3) internal view
```

### log

```solidity
function log(string p0, uint256 p1, string p2, address p3) internal view
```

### log

```solidity
function log(string p0, uint256 p1, bool p2, uint256 p3) internal view
```

### log

```solidity
function log(string p0, uint256 p1, bool p2, string p3) internal view
```

### log

```solidity
function log(string p0, uint256 p1, bool p2, bool p3) internal view
```

### log

```solidity
function log(string p0, uint256 p1, bool p2, address p3) internal view
```

### log

```solidity
function log(string p0, uint256 p1, address p2, uint256 p3) internal view
```

### log

```solidity
function log(string p0, uint256 p1, address p2, string p3) internal view
```

### log

```solidity
function log(string p0, uint256 p1, address p2, bool p3) internal view
```

### log

```solidity
function log(string p0, uint256 p1, address p2, address p3) internal view
```

### log

```solidity
function log(string p0, string p1, uint256 p2, uint256 p3) internal view
```

### log

```solidity
function log(string p0, string p1, uint256 p2, string p3) internal view
```

### log

```solidity
function log(string p0, string p1, uint256 p2, bool p3) internal view
```

### log

```solidity
function log(string p0, string p1, uint256 p2, address p3) internal view
```

### log

```solidity
function log(string p0, string p1, string p2, uint256 p3) internal view
```

### log

```solidity
function log(string p0, string p1, string p2, string p3) internal view
```

### log

```solidity
function log(string p0, string p1, string p2, bool p3) internal view
```

### log

```solidity
function log(string p0, string p1, string p2, address p3) internal view
```

### log

```solidity
function log(string p0, string p1, bool p2, uint256 p3) internal view
```

### log

```solidity
function log(string p0, string p1, bool p2, string p3) internal view
```

### log

```solidity
function log(string p0, string p1, bool p2, bool p3) internal view
```

### log

```solidity
function log(string p0, string p1, bool p2, address p3) internal view
```

### log

```solidity
function log(string p0, string p1, address p2, uint256 p3) internal view
```

### log

```solidity
function log(string p0, string p1, address p2, string p3) internal view
```

### log

```solidity
function log(string p0, string p1, address p2, bool p3) internal view
```

### log

```solidity
function log(string p0, string p1, address p2, address p3) internal view
```

### log

```solidity
function log(string p0, bool p1, uint256 p2, uint256 p3) internal view
```

### log

```solidity
function log(string p0, bool p1, uint256 p2, string p3) internal view
```

### log

```solidity
function log(string p0, bool p1, uint256 p2, bool p3) internal view
```

### log

```solidity
function log(string p0, bool p1, uint256 p2, address p3) internal view
```

### log

```solidity
function log(string p0, bool p1, string p2, uint256 p3) internal view
```

### log

```solidity
function log(string p0, bool p1, string p2, string p3) internal view
```

### log

```solidity
function log(string p0, bool p1, string p2, bool p3) internal view
```

### log

```solidity
function log(string p0, bool p1, string p2, address p3) internal view
```

### log

```solidity
function log(string p0, bool p1, bool p2, uint256 p3) internal view
```

### log

```solidity
function log(string p0, bool p1, bool p2, string p3) internal view
```

### log

```solidity
function log(string p0, bool p1, bool p2, bool p3) internal view
```

### log

```solidity
function log(string p0, bool p1, bool p2, address p3) internal view
```

### log

```solidity
function log(string p0, bool p1, address p2, uint256 p3) internal view
```

### log

```solidity
function log(string p0, bool p1, address p2, string p3) internal view
```

### log

```solidity
function log(string p0, bool p1, address p2, bool p3) internal view
```

### log

```solidity
function log(string p0, bool p1, address p2, address p3) internal view
```

### log

```solidity
function log(string p0, address p1, uint256 p2, uint256 p3) internal view
```

### log

```solidity
function log(string p0, address p1, uint256 p2, string p3) internal view
```

### log

```solidity
function log(string p0, address p1, uint256 p2, bool p3) internal view
```

### log

```solidity
function log(string p0, address p1, uint256 p2, address p3) internal view
```

### log

```solidity
function log(string p0, address p1, string p2, uint256 p3) internal view
```

### log

```solidity
function log(string p0, address p1, string p2, string p3) internal view
```

### log

```solidity
function log(string p0, address p1, string p2, bool p3) internal view
```

### log

```solidity
function log(string p0, address p1, string p2, address p3) internal view
```

### log

```solidity
function log(string p0, address p1, bool p2, uint256 p3) internal view
```

### log

```solidity
function log(string p0, address p1, bool p2, string p3) internal view
```

### log

```solidity
function log(string p0, address p1, bool p2, bool p3) internal view
```

### log

```solidity
function log(string p0, address p1, bool p2, address p3) internal view
```

### log

```solidity
function log(string p0, address p1, address p2, uint256 p3) internal view
```

### log

```solidity
function log(string p0, address p1, address p2, string p3) internal view
```

### log

```solidity
function log(string p0, address p1, address p2, bool p3) internal view
```

### log

```solidity
function log(string p0, address p1, address p2, address p3) internal view
```

### log

```solidity
function log(bool p0, uint256 p1, uint256 p2, uint256 p3) internal view
```

### log

```solidity
function log(bool p0, uint256 p1, uint256 p2, string p3) internal view
```

### log

```solidity
function log(bool p0, uint256 p1, uint256 p2, bool p3) internal view
```

### log

```solidity
function log(bool p0, uint256 p1, uint256 p2, address p3) internal view
```

### log

```solidity
function log(bool p0, uint256 p1, string p2, uint256 p3) internal view
```

### log

```solidity
function log(bool p0, uint256 p1, string p2, string p3) internal view
```

### log

```solidity
function log(bool p0, uint256 p1, string p2, bool p3) internal view
```

### log

```solidity
function log(bool p0, uint256 p1, string p2, address p3) internal view
```

### log

```solidity
function log(bool p0, uint256 p1, bool p2, uint256 p3) internal view
```

### log

```solidity
function log(bool p0, uint256 p1, bool p2, string p3) internal view
```

### log

```solidity
function log(bool p0, uint256 p1, bool p2, bool p3) internal view
```

### log

```solidity
function log(bool p0, uint256 p1, bool p2, address p3) internal view
```

### log

```solidity
function log(bool p0, uint256 p1, address p2, uint256 p3) internal view
```

### log

```solidity
function log(bool p0, uint256 p1, address p2, string p3) internal view
```

### log

```solidity
function log(bool p0, uint256 p1, address p2, bool p3) internal view
```

### log

```solidity
function log(bool p0, uint256 p1, address p2, address p3) internal view
```

### log

```solidity
function log(bool p0, string p1, uint256 p2, uint256 p3) internal view
```

### log

```solidity
function log(bool p0, string p1, uint256 p2, string p3) internal view
```

### log

```solidity
function log(bool p0, string p1, uint256 p2, bool p3) internal view
```

### log

```solidity
function log(bool p0, string p1, uint256 p2, address p3) internal view
```

### log

```solidity
function log(bool p0, string p1, string p2, uint256 p3) internal view
```

### log

```solidity
function log(bool p0, string p1, string p2, string p3) internal view
```

### log

```solidity
function log(bool p0, string p1, string p2, bool p3) internal view
```

### log

```solidity
function log(bool p0, string p1, string p2, address p3) internal view
```

### log

```solidity
function log(bool p0, string p1, bool p2, uint256 p3) internal view
```

### log

```solidity
function log(bool p0, string p1, bool p2, string p3) internal view
```

### log

```solidity
function log(bool p0, string p1, bool p2, bool p3) internal view
```

### log

```solidity
function log(bool p0, string p1, bool p2, address p3) internal view
```

### log

```solidity
function log(bool p0, string p1, address p2, uint256 p3) internal view
```

### log

```solidity
function log(bool p0, string p1, address p2, string p3) internal view
```

### log

```solidity
function log(bool p0, string p1, address p2, bool p3) internal view
```

### log

```solidity
function log(bool p0, string p1, address p2, address p3) internal view
```

### log

```solidity
function log(bool p0, bool p1, uint256 p2, uint256 p3) internal view
```

### log

```solidity
function log(bool p0, bool p1, uint256 p2, string p3) internal view
```

### log

```solidity
function log(bool p0, bool p1, uint256 p2, bool p3) internal view
```

### log

```solidity
function log(bool p0, bool p1, uint256 p2, address p3) internal view
```

### log

```solidity
function log(bool p0, bool p1, string p2, uint256 p3) internal view
```

### log

```solidity
function log(bool p0, bool p1, string p2, string p3) internal view
```

### log

```solidity
function log(bool p0, bool p1, string p2, bool p3) internal view
```

### log

```solidity
function log(bool p0, bool p1, string p2, address p3) internal view
```

### log

```solidity
function log(bool p0, bool p1, bool p2, uint256 p3) internal view
```

### log

```solidity
function log(bool p0, bool p1, bool p2, string p3) internal view
```

### log

```solidity
function log(bool p0, bool p1, bool p2, bool p3) internal view
```

### log

```solidity
function log(bool p0, bool p1, bool p2, address p3) internal view
```

### log

```solidity
function log(bool p0, bool p1, address p2, uint256 p3) internal view
```

### log

```solidity
function log(bool p0, bool p1, address p2, string p3) internal view
```

### log

```solidity
function log(bool p0, bool p1, address p2, bool p3) internal view
```

### log

```solidity
function log(bool p0, bool p1, address p2, address p3) internal view
```

### log

```solidity
function log(bool p0, address p1, uint256 p2, uint256 p3) internal view
```

### log

```solidity
function log(bool p0, address p1, uint256 p2, string p3) internal view
```

### log

```solidity
function log(bool p0, address p1, uint256 p2, bool p3) internal view
```

### log

```solidity
function log(bool p0, address p1, uint256 p2, address p3) internal view
```

### log

```solidity
function log(bool p0, address p1, string p2, uint256 p3) internal view
```

### log

```solidity
function log(bool p0, address p1, string p2, string p3) internal view
```

### log

```solidity
function log(bool p0, address p1, string p2, bool p3) internal view
```

### log

```solidity
function log(bool p0, address p1, string p2, address p3) internal view
```

### log

```solidity
function log(bool p0, address p1, bool p2, uint256 p3) internal view
```

### log

```solidity
function log(bool p0, address p1, bool p2, string p3) internal view
```

### log

```solidity
function log(bool p0, address p1, bool p2, bool p3) internal view
```

### log

```solidity
function log(bool p0, address p1, bool p2, address p3) internal view
```

### log

```solidity
function log(bool p0, address p1, address p2, uint256 p3) internal view
```

### log

```solidity
function log(bool p0, address p1, address p2, string p3) internal view
```

### log

```solidity
function log(bool p0, address p1, address p2, bool p3) internal view
```

### log

```solidity
function log(bool p0, address p1, address p2, address p3) internal view
```

### log

```solidity
function log(address p0, uint256 p1, uint256 p2, uint256 p3) internal view
```

### log

```solidity
function log(address p0, uint256 p1, uint256 p2, string p3) internal view
```

### log

```solidity
function log(address p0, uint256 p1, uint256 p2, bool p3) internal view
```

### log

```solidity
function log(address p0, uint256 p1, uint256 p2, address p3) internal view
```

### log

```solidity
function log(address p0, uint256 p1, string p2, uint256 p3) internal view
```

### log

```solidity
function log(address p0, uint256 p1, string p2, string p3) internal view
```

### log

```solidity
function log(address p0, uint256 p1, string p2, bool p3) internal view
```

### log

```solidity
function log(address p0, uint256 p1, string p2, address p3) internal view
```

### log

```solidity
function log(address p0, uint256 p1, bool p2, uint256 p3) internal view
```

### log

```solidity
function log(address p0, uint256 p1, bool p2, string p3) internal view
```

### log

```solidity
function log(address p0, uint256 p1, bool p2, bool p3) internal view
```

### log

```solidity
function log(address p0, uint256 p1, bool p2, address p3) internal view
```

### log

```solidity
function log(address p0, uint256 p1, address p2, uint256 p3) internal view
```

### log

```solidity
function log(address p0, uint256 p1, address p2, string p3) internal view
```

### log

```solidity
function log(address p0, uint256 p1, address p2, bool p3) internal view
```

### log

```solidity
function log(address p0, uint256 p1, address p2, address p3) internal view
```

### log

```solidity
function log(address p0, string p1, uint256 p2, uint256 p3) internal view
```

### log

```solidity
function log(address p0, string p1, uint256 p2, string p3) internal view
```

### log

```solidity
function log(address p0, string p1, uint256 p2, bool p3) internal view
```

### log

```solidity
function log(address p0, string p1, uint256 p2, address p3) internal view
```

### log

```solidity
function log(address p0, string p1, string p2, uint256 p3) internal view
```

### log

```solidity
function log(address p0, string p1, string p2, string p3) internal view
```

### log

```solidity
function log(address p0, string p1, string p2, bool p3) internal view
```

### log

```solidity
function log(address p0, string p1, string p2, address p3) internal view
```

### log

```solidity
function log(address p0, string p1, bool p2, uint256 p3) internal view
```

### log

```solidity
function log(address p0, string p1, bool p2, string p3) internal view
```

### log

```solidity
function log(address p0, string p1, bool p2, bool p3) internal view
```

### log

```solidity
function log(address p0, string p1, bool p2, address p3) internal view
```

### log

```solidity
function log(address p0, string p1, address p2, uint256 p3) internal view
```

### log

```solidity
function log(address p0, string p1, address p2, string p3) internal view
```

### log

```solidity
function log(address p0, string p1, address p2, bool p3) internal view
```

### log

```solidity
function log(address p0, string p1, address p2, address p3) internal view
```

### log

```solidity
function log(address p0, bool p1, uint256 p2, uint256 p3) internal view
```

### log

```solidity
function log(address p0, bool p1, uint256 p2, string p3) internal view
```

### log

```solidity
function log(address p0, bool p1, uint256 p2, bool p3) internal view
```

### log

```solidity
function log(address p0, bool p1, uint256 p2, address p3) internal view
```

### log

```solidity
function log(address p0, bool p1, string p2, uint256 p3) internal view
```

### log

```solidity
function log(address p0, bool p1, string p2, string p3) internal view
```

### log

```solidity
function log(address p0, bool p1, string p2, bool p3) internal view
```

### log

```solidity
function log(address p0, bool p1, string p2, address p3) internal view
```

### log

```solidity
function log(address p0, bool p1, bool p2, uint256 p3) internal view
```

### log

```solidity
function log(address p0, bool p1, bool p2, string p3) internal view
```

### log

```solidity
function log(address p0, bool p1, bool p2, bool p3) internal view
```

### log

```solidity
function log(address p0, bool p1, bool p2, address p3) internal view
```

### log

```solidity
function log(address p0, bool p1, address p2, uint256 p3) internal view
```

### log

```solidity
function log(address p0, bool p1, address p2, string p3) internal view
```

### log

```solidity
function log(address p0, bool p1, address p2, bool p3) internal view
```

### log

```solidity
function log(address p0, bool p1, address p2, address p3) internal view
```

### log

```solidity
function log(address p0, address p1, uint256 p2, uint256 p3) internal view
```

### log

```solidity
function log(address p0, address p1, uint256 p2, string p3) internal view
```

### log

```solidity
function log(address p0, address p1, uint256 p2, bool p3) internal view
```

### log

```solidity
function log(address p0, address p1, uint256 p2, address p3) internal view
```

### log

```solidity
function log(address p0, address p1, string p2, uint256 p3) internal view
```

### log

```solidity
function log(address p0, address p1, string p2, string p3) internal view
```

### log

```solidity
function log(address p0, address p1, string p2, bool p3) internal view
```

### log

```solidity
function log(address p0, address p1, string p2, address p3) internal view
```

### log

```solidity
function log(address p0, address p1, bool p2, uint256 p3) internal view
```

### log

```solidity
function log(address p0, address p1, bool p2, string p3) internal view
```

### log

```solidity
function log(address p0, address p1, bool p2, bool p3) internal view
```

### log

```solidity
function log(address p0, address p1, bool p2, address p3) internal view
```

### log

```solidity
function log(address p0, address p1, address p2, uint256 p3) internal view
```

### log

```solidity
function log(address p0, address p1, address p2, string p3) internal view
```

### log

```solidity
function log(address p0, address p1, address p2, bool p3) internal view
```

### log

```solidity
function log(address p0, address p1, address p2, address p3) internal view
```

## Strings

_String operations._

### _HEX_SYMBOLS

```solidity
bytes16 _HEX_SYMBOLS
```

### toString

```solidity
function toString(uint256 value) internal pure returns (string)
```

_Converts a `uint256` to its ASCII `string` decimal representation._

### toHexString

```solidity
function toHexString(uint256 value) internal pure returns (string)
```

_Converts a `uint256` to its ASCII `string` hexadecimal representation._

### toHexString

```solidity
function toHexString(uint256 value, uint256 length) internal pure returns (string)
```

_Converts a `uint256` to its ASCII `string` hexadecimal representation with fixed length._

