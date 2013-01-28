--Premium Only: SCONFIG = L2TConfig.GetConfig();
--Premium Only: SCONFIG_FILE = GetDir() .. '\\scripts\\skilldump.l2b';
--Premium Only: L2TConfig.SaveConfig(SCONFIG_FILE);
moveDistance = 30;

MoveTo(-17572, 41899, -3700, moveDistance);
UseSkill(11509, false, false); -- Атака Штурмом
UseSkill(11510, false, false); -- Меч Тени
UseSkill(11511, false, false); -- Смертельный Удар
UseSkill(11513, false, false); -- Пылающая Ярость
UseSkill(11514, false, false); -- Сокрушительный Шторм
--Premium Only: L2TConfig.LoadConfig(SCONFIG_FILE);
