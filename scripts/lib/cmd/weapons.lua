-- Table of weaponTypes for use with `findString()` from `lib.cmd.common`
return
{
	{function (str) return str:find("^[cC]ha") end,  0, "ChainGun"},
	{function (str) return str:find("^[pP]oi.*[cC]ha") end,  1, "PointDefenseChainGun"},
	{function (str) return str:find("^[pP]oi.*[lL]as") end, 2, "PointDefenseLaser"},
	{function (str) return str:find("^[lL]as") end,  3, "Laser"},
	{function (str) return str:find("^[mM]in") end,  4, "MiningLaser"},
	{function (str) return str:find("^[rR]aw[mM]in") end,  5, "RawMiningLaser"},
	{function (str) return str:find("^[sS]al") end, 6, "SalvagingLaser"},
	{function (str) return str:find("^[rR]aw[sS]al") end, 7, "RawSalvagingLaser"},
	{function (str) return str:find("^[pP]la") end,  8, "PlasmaGun"},
	{function (str) return str:find("^[rR]oc") end,  9, "RocketLauncher"},
	{function (str) return str:find("^[cC]an") end,  10, "Cannon"},
	{function (str) return str:find("^[rR]ai") end,  11, "RailGun"},
	{function (str) return str:find("^[rR]ep") end,  12, "RepairBeam"},
	{function (str) return str:find("^[bB]ol") end,  13, "Bolter"},
	{function (str) return str:find("^[lL]ig") end,  14, "LightningGun"},
	{function (str) return str:find("^[tT]es") end, 15, "TeslaGun"},
	{function (str) return str:find("^[fF]or") end, 16, "ForceGun"},
	{function (str) return str:find("^[pP]ul") end, 17, "PulseCannon"},
	{function (str) return str:find("^[aA]nt") end, 18, "AntiFighter"},
}
