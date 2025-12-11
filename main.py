import tkinter
import clips

BLUE = "#00b2ca"
ORANGE = "#f79256"
ORANGE2 = "#cc7645"
YELLOW = "#f4f756"


FONT = ("Segoe UI", 16)

root = tkinter.Tk()
env = clips.Environment()
current_question_id = None

def clear():
    for el in root.winfo_children():
        el.destroy()

def render_question(text, answers):
    clear()
    
    label = tkinter.Label(root, text=text, background=BLUE, font=FONT)
    label.pack(pady=20)

    frame = tkinter.Frame(background=BLUE)
    frame.pack()
    for b in answers:
        text = b
        button = tkinter.Button(frame, text=b, background=ORANGE, activebackground=ORANGE2, font=FONT, width=24, command=lambda text=text: handle_button_click(text))
        button.pack(side="top", padx=10, pady=20)

def render_result(result):
    clear()
    label1 = tkinter.Label(root, text="Result:", background=BLUE, font=FONT)
    label1.pack(pady=20)

    frame = tkinter.Frame(background=YELLOW, padx=20, pady=20)
    frame.pack()
    label2 = tkinter.Label(frame, text=result, background=YELLOW, font=FONT)
    label2.pack(pady=10, padx=10)


def handle_button_click(value):

    template = env.find_template("answer")
    template.assert_fact(id=current_question_id, value=value)

    env.run()
    next_question()


def next_question():
    global current_question_id

    for f in list(env.facts()):
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
    root.configure(bg=BLUE)
    root.mainloop()

if __name__ == '__main__':
    main()

    