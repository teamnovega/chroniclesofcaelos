/// demo_text_make(name, age);


var text = "Like Unity Playerprefs system, but in Game Maker.#";
text += "#";
text += "    >> Your name: " + string(argument0) + "#";
text += "    >> Your age: " + string(argument1) + "#";

if (has_played) {
    text += "    >> You have played this demo before#";
} else {
    text += "    >> Your haven't played this demo before#";
}

text += "#";
text += "Press <Intro> to set your name and age again.#";
text += "Press <Space> to DELETE all your data.#"
text += "Press <N> to remove only your name.#"
text += "Press <A> to remove only your age.#";
text += "Press <S> to FORCE save data to disk.#";
text += "Press <R> to RESTART the demo.#";
text += "#";
text += "#";
text += "#";
text += "To see the demo code, check the #"
text += "create event of the obj_demo.#";

return text;
