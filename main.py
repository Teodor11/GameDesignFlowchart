import tkinter
import clips

FONT = ("Segoe UI", 16)

root = tkinter.Tk()
env = clips.Environment()
current_question_id = None

def clear():
    for el in root.winfo_children():
        el.destroy()

def render_question(text, answers):
    clear()
    
    label = tkinter.Label(root, text=text, font=FONT)
    label.pack(pady=20)

    frame = tkinter.Frame()
    frame.pack()
    for b in answers:
        text = b
        button = tkinter.Button(frame, text=b, font=FONT, width=20, command=lambda text=text: handle_button_click(text))
        button.pack(side="left", padx=10, pady=20)

def render_result(result):
    clear()
    label1 = tkinter.Label(root, text="Result:", font=FONT)
    label1.pack(pady=20)
    label2 = tkinter.Label(root, text=result, font=FONT)
    label2.pack(pady=20)


def handle_button_click(value):
    print("Clicked button:", value)

    template = env.find_template("answer")
    template.assert_fact(id=current_question_id, value=value)

    env.run()
    next_question()


def next_question():
    global current_question_id

    print(list(env.facts()))

    for f in list(env.facts()):
        print("fact:", f)
        if f.template.name == "result":
            render_result(f["text"])
            f.retract()
            break
   
        elif f.template.name == "question":
            current_question_id = f["id"] 
            render_question(f["text"], list(f["answers"]))
            f.retract()
            break


def main():
    env.load("rules.clp")
    env.reset()
    env.run()
    next_question()

    root.title("Game design flowchart")
    root.geometry("800x600")
    root.configure(bg="#3d3def")
    root.mainloop()

if __name__ == '__main__':
    main()

    