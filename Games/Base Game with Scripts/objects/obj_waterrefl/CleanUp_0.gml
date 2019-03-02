/// @description Clean Up Resources
ds_list_destroy(global.refl_insts);
ds_list_destroy(global.refl_offsets);
ds_list_destroy(global.water_insts);

if (surface_exists(global.refl_surf)){
	surface_free(global.refl_surf);
}