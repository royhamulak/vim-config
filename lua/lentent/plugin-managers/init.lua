return function(lazy)
	if lazy == true then
		require("lentent.plugin-managers.lazy")
	else
		require("lentent.plugin-managers.vim-plug")
	end
end
