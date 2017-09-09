/// playerprefs_get_instance();
/**
    Normally you DON'T NEED to use this funcion. This is an advanced function.
    But if you need for some reason access to the obj_playerprefs DO NOT ACCESS IT manually, 
    use playerprefs_get_instance() to get a reference to the obj_playerprefs.
    
*/


if (instance_exists(obj_playerprefs)) { return obj_playerprefs;}
return instance_create(0,0,obj_playerprefs);
