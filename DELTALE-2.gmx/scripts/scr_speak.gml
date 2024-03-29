with (obj_speaker) {

    if (!instance_exists(dialog)) {
    
        dialog = instance_create(view_xview[0],view_yview[0],obj_dialog);
        instance_create(x,y,obj_dialogSound);
        dialog.textspd = textspd;
        dialog.char = char;
        dialog.text = text;
        dialog.image = image;
        dialog.image1 = image1;
        
    } else {
    
        if (dialog.text_visible = string(dialog.text[dialog.text_page])) {
            
            if (is_string(dialog.text[dialog.text_page])) {
                instance_create(x,y,obj_dialogSound);
                dialog.textspd_page++;
                dialog.char_page++;
                dialog.text_page++;
                dialog.image_page++;
                dialog.image1_page++;
                dialog.text_count = 0;
                if (dialog.text_page > array_length_1d(dialog.text)-1)
                {
                    dialog.textspd_page = array_length_1d(dialog.textspd)-1;
                    dialog.char_page = array_length_1d(dialog.char)-1;
                    dialog.text_page = array_length_1d(dialog.text)-1;
                    dialog.image_page = array_length_1d(dialog.image)-1;
                    dialog.image1_page = array_length_1d(dialog.image1)-1;
                    with (dialog) {
                        text_count = string_length(text[text_page]);
                        destroy = 1;
                    }
                    if (charDialog == true) {
                        event_perform(ev_other,ev_user0);
                    }
                }
            } else {
                scr = dialog.text[dialog.text_page];
                script_execute(scr);
                
                instance_create(x,y,obj_dialogSound);
                dialog.textspd_page++;
                dialog.char_page++;
                dialog.text_page++;
                dialog.image_page++;
                dialog.image1_page++;
                dialog.text_count = 0;
                if (dialog.text_page > array_length_1d(dialog.text)-1)
                {
                    dialog.textspd_page = array_length_1d(dialog.textspd)-1;
                    dialog.char_page = array_length_1d(dialog.char)-1;
                    dialog.text_page = array_length_1d(dialog.text)-1;
                    dialog.image_page = array_length_1d(dialog.image)-1;
                    dialog.image1_page = array_length_1d(dialog.image1)-1;
                    with (dialog) {
                        text_count = string_length(text[text_page]);
                        destroy = 1;
                    }
                    if (charDialog == true) {
                        event_perform(ev_other,ev_user0);
                    }
                }
            }
            
        }
    
    }
}
