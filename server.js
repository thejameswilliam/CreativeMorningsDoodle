const express = require("express");
const fs = require("fs");
const path = require("path");

const app = express();
const PORT = 8080;

// Parse JSON bodies (increase limit so base64 images are okay)
app.use(express.json({ limit: "10mb" }));

// Serve static files (front-end) from /public
app.use(express.static(path.join(__dirname, "public")));

// Endpoint to save the drawing
app.post("/save-drawing", (req, res) => {
  const { image } = req.body;

  if (!image || typeof image !== "string") {
    return res.status(400).json({ ok: false, error: "No image data" });
  }

  const matches = image.match(/^data:image\/png;base64,(.+)$/);
  if (!matches || matches.length !== 2) {
    return res.status(400).json({ ok: false, error: "Invalid image data" });
  }

  const base64Data = matches[1];
  const buffer = Buffer.from(base64Data, "base64");

  const drawingsDir = path.join(__dirname, "drawings");
  fs.mkdirSync(drawingsDir, { recursive: true });

  // Sequential numbering
  const files = fs.readdirSync(drawingsDir);

  const existingNumbers = files
    .map(f => f.match(/^(\d{3})\.png$/))
    .filter(Boolean)
    .map(match => parseInt(match[1], 10));

  const nextNum = (Math.max(0, ...existingNumbers) + 1)
    .toString()
    .padStart(3, "0");

  const filename = `${nextNum}.png`;
  const filePath = path.join(drawingsDir, filename);

  fs.writeFile(filePath, buffer, (err) => {
    if (err) {
      console.error("Error saving file:", err);
      return res.status(500).json({ ok: false, error: "Error saving file" });
    }

    console.log("Saved drawing:", filePath);
    res.json({ ok: true, filename });
  });
});

app.listen(PORT, () => {
  console.log(`CreativeMornings doodle app running at http://localhost:${PORT}`);
});