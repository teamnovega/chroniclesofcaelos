/// scr_easterEgg_dateCheck("holiday");
var holiday = argument0;
var currentYear = date_get_year(date_current_datetime());
// define holidays here
var halloween = date_create_datetime(currentYear,10,31,0,0,0);
var christmas = date_create_datetime(currentYear,12,25,0,0,0);
var newYear = date_create_datetime(currentYear,1,1,0,0,0);
//
switch (holiday) {

    case 'halloween':
            if (date_is_today(halloween)) {
                return true;
            } else {return false;}
        break;

    case 'christmas':
            if (date_is_today(christmas)) {
                return true;
            } else {return false;}
        break;

    case 'newYear':
            if (date_is_today(newYear)) {
                return true;
            } else {return false;}
        break;

    default:
            show_error("Error: Invalid Holiday!", true);
        break;

}
