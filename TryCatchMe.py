try:
    import tkinter as tk
    import tkinter.ttk as ttk
    from tkinter import *
    import random
    import pyttsx3
    from PIL import ImageTk, Image
except ImportError:
    import subprocess
    import sys

    def install_package(package):
        subprocess.check_call([sys.executable, "-m", "pip", "install", package])

    try:
        import tkinter as tk
        import tkinter.ttk as ttk
        from tkinter import *
        import random
        import pyttsx3
        from PIL import ImageTk, Image
    except ImportError:
        install_package("tk")
        install_package("pyttsx3")
        install_package("pillow")
        import tkinter as tk
        import tkinter.ttk as ttk
        from tkinter import *
        import random
        import pyttsx3
        from PIL import ImageTk, Image

images = ["Patrick1.png", "Patrick2.png", "Spongebob.png"]

class TryCatchMeWindow:

    def __init__(self, master, text):
        self.master = master
        self.popup = tk.Toplevel(master)
        self.popup.title("Is Mayonaise an instrument?")
        self.popup.protocol("WM_DELETE_WINDOW", self.try_close)
        self.popup.overrideredirect(1)

        #Create Image
        randomImage = random.randint(0, 2)
        self.popup_frame = ImageTk.PhotoImage(Image.open(images[randomImage]))
        self.popup_frame_size = Label(self.popup)
        self.popup_frame_size.image = self.popup_frame  # <== this is were we anchor the img object
        self.popup_frame_size.configure(image=self.popup_frame)
        self.popup_frame_size.pack(side=TOP, fill=X)

        # Create a button widget for closing the popup window
        self.close_button = Button(self.popup, text=text, background="white", font=("Helvetica", 14), command=self.try_close)
        self.close_button.pack(pady=20)

        # Random position
        self.x = random.randint(0, master.winfo_screenwidth() - 580)
        self.y = random.randint(0, master.winfo_screenheight() - 460)
        self.popup.geometry("+{}+{}".format(self.x, self.y))

    def try_close(self):
        self.popup.destroy()
        TryCatchMeWindow(self.master, "Try one more time!")

root = tk.Tk()
root.withdraw()
tryCatchMeWindow = TryCatchMeWindow(root, "Close!")
root.mainloop()