// Deactivate everything
instance_deactivate_all(true);
// Activate everything important
instance_activate_object(obj_player);
instance_activate_object(obj_view);
instance_activate_object(obj_pauseController);
instance_activate_object(obj_fsController);
instance_activate_object(obj_controller);
instance_activate_object(obj_playerStats);
instance_activate_object(obj_lightController);
instance_activate_object(obj_aspectratio);
instance_activate_object(obj_ABXY);
instance_activate_object(obj_music_player);
instance_activate_object(obj_playmusic);
instance_activate_object(obj_heartWingHPController);
instance_activate_object(obj_parentLight);
instance_activate_object(oSFXMixer);
if (instance_exists(obj_screenshake)) {
    instance_activate_object(obj_screenshake);
}
if (instance_exists(obj_snoopdogg_restart))
{
    instance_activate_object(obj_snoopdogg_restart);
}
if (instance_exists(obj_snoopdogg))
{
    instance_activate_object(obj_snoopdogg);
}
// Activate everything that's in the view
instance_activate_region(view_xview[0]-800,view_yview[0]-800,view_wview[0]+800,view_hview[0]+800,true)
