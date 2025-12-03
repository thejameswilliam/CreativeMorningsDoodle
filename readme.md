# Creative Mornings Doodle App

A small Node.js + HTML5 canvas application used at CreativeMornings Santa Fe (hosted at Make Santa Fe) to let participants draw what **innovation** means to them.  
Each drawing is saved as a PNG and auto-numbered (`001.png`, `002.png`, etc.) for later engraving on keyrings.

#LearnBuildThrive  
#MakeSantaFe  

---

## 🚀 Features

- Finger/mouse drawing on an HTML5 canvas  
- One-color line drawing  
- “Clear” button  
- “Save Drawing” with confirmation popup  
- Auto-clears after save  
- Saves each drawing to `/drawings/` as sequential PNG files  
- Fully offline, runs on any laptop at the event  

---

## 📦 Requirements

- Node.js 16+  
- npm (comes with Node)  

---

## 🔧 Installation

Clone the repo:

```bash
git clone https://github.com/thejameswilliam/CreativeMorningsDoodle.git
cd CreativeMorningsDoodle
```

Install dependencies:

```bash
npm install
```

---

## ▶️ Running the App

Start the server:

```bash
node server.js
```

The app will be available at:

```
http://localhost:3000
```

---

## 💾 Saved Files

All submitted drawings are saved automatically to:

```
/drawings/
```

Each file is named sequentially:

```
001.png
002.png
003.png
...
```

This makes batch laser-engraving simple.

---

## 🛠 Development Notes

- To change numbering format (e.g., 0001.png), edit the padding logic in `/save-drawing` inside `server.js`.  
- To change line width or color, edit the canvas setup in `public/index.html`.  
- Server must have write access to the project folder to save drawings.

---

## 🙌 Credits

Created for the **CreativeMornings Santa Fe** gathering hosted at **Make Santa Fe**, a nonprofit makerspace dedicated to helping people **Learn. Build. Thrive.**
