with (obj_speaker) {

    if (!instance_exists(dialog)) {
    
        dialog = instance_create(view_xview[0],view_yview[0],obj_dialog);
        dialog.textspd = textspd;
        dialog.char = char;
        dialog.text = text;
        dialog.image = image;
        dialog.image1 = image1;
        dialog.voice = voice;
        instance_create(x,y,obj_dialogSound);
        
    } else {
    
        if (dialog.text_visible = string(dialog.text[dialog.text_page])) {
            
            if (is_string(dialog.text[dialog.text_page])) {
                dialog.textspd_page++;
                dialog.char_page++;
                dialog.text_page++;
                dialog.image_page++;
                dialog.image1_page++;
                dialog.voice_page++;
                dialog.text_count = 0;
                if (dialog.text_page > array_length_1d(dialog.text)-1)
                {
                    dialog.textspd_page = array_length_1d(dialog.textspd)-1;
                    dialog.char_page = array_length_1d(dialog.char)-1;
                    dialog.text_page = array_length_1d(dialog.text)-1;
                    dialog.image_page = array_length_1d(dialog.image)-1;
                    dialog.image1_page = array_length_1d(dialog.image1)-1;
                    dialog.voice_page = array_length_1d(dialog.voice)-1;
                    with (dialog) {
                        text_count = string_length(text[text_page]);
                        destroy = 1;
                    }
                }
                instance_create(x,y,obj_dialogSound);
            } else {
                scr = dialog.text[dialog.text_page];
                script_execute(scr);
                
                dialog.textspd_page++;
                dialog.char_page++;
                dialog.text_page++;
                dialog.image_page++;
                dialog.image1_page++;
                dialog.voice_page++;
                dialog.text_count = 0;
                if (dialog.text_page > array_length_1d(dialog.text)-1)
                {
                    dialog.textspd_page = array_length_1d(dialog.textspd)-1;
                    dialog.char_page = array_length_1d(dialog.char)-1;
                    dialog.text_page = array_length_1d(dialog.text)-1;
                    dialog.image_page = array_length_1d(dialog.image)-1;
                    dialog.image1_page = array_length_1d(dialog.image1)-1;
                    dialog.voice_page = array_length_1d(dialog.voice)-1;
                    with (dialog) {
                        text_count = string_length(text[text_page]);
                        destroy = 1;
                    }
                }
                instance_create(x,y,obj_dialogSound);
            }
            
        }
    
    }
}
