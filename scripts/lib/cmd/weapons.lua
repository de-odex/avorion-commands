-- Table of weaponTypes for use with `findString()` from `lib.cmd.common`
return
{
	{function (str) return str:find("^[cC]ha") end,  0, "ChainGun"},
	{function (str) return str:find("^[pP]oi.*[cC]ha") end,  1, "PointDefenseChainGun"},
	{function (str) return str:find("^[pP]oi.*[lL]as") end, 2, "PointDefenseLaser"},
	{function (str) return str:find("^[lL]as") end,  3, "Laser"},
	{function (str) return str:find("^[mM]in") end,  4, "MiningLaser"},
	{function (str) return str:find("^[pP]la") end,  5, "PlasmaGun"},
	{function (str) return str:find("^[rR]oc") end,  6, "RocketLauncher"},
	{function (str) return str:find("^[cC]an") end,  7, "Cannon"},
	{function (str) return str:find("^[rR]ai") end,  8, "RailGun"},
	{function (str) return str:find("^[rR]ep") end,  9, "RepairBeam"},
	{function (str) return str:find("^[bB]ol") end,  10, "Bolter"},
	{function (str) return str:find("^[lL]ig") end,  11, "LightningGun"},
	{function (str) return str:find("^[tT]es") end, 12, "TeslaGun"},
	{function (str) return str:find("^[fF]or") end, 13, "ForceGun"},
	{function (str) return str:find("^[sS]al") end, 14, "SalvagingLaser"},
	{function (str) return str:find("^[pP]ulse") end, 15, "PulseCannon"},
	{function (str) return str:find("^[aA]nt") end, 16, "AntiFighter"},
}