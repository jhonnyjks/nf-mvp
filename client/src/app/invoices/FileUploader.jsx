import React, { useRef, useState } from "react";
import axios from "axios";
import { toastr } from 'react-redux-toastr'

export default function FileUploader({ apiHost, onUpload = () => {} }) {
  const inputRef = useRef(null);
  const [msg, setMsg] = useState("");
  const [busy, setBusy] = useState(false);

  const API_HOST = apiHost || process.env.REACT_APP_API_HOST || "http://localhost:8000";
  const URL = `${API_HOST}/invoices`;

  // Convert file -> base64 (strip the data:...;base64, prefix)
  const toBase64 = (file) =>
    new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.onload = () => {
        const result = String(reader.result || "");
        const base64 = result.includes(",") ? result.split(",")[1] : result;
        resolve(base64);
      };
      reader.onerror = reject;
      reader.readAsDataURL(file);
    });

  async function handleUpload(e) {
    e.preventDefault(); // in case this sits inside a <form>
    if (busy) return;

    const el = inputRef.current;
    if (!el?.files?.length) {
      setMsg("Select a file first.");
      return;
    }

    const file = el.files[0];

    // Optional guard – base64 adds ~33% overhead
    if (file.size > 10 * 1024 * 1024) {
      setMsg("File too large (>10MB).");
      return;
    }

    try {
      setBusy(true);
      setMsg("Encoding…");

      const b64 = await toBase64(file);

      const payload = {
        file: b64,                          
        filename: file.name,
        mime: file.type || "application/octet-stream",
      };

      // Log payload size BEFORE sending
      const approxBytes = new Blob([JSON.stringify(payload)]).size;
      console.log("Payload bytes (approx):", approxBytes);
      console.log("Payload preview:", {
        ...payload,
        file: `${b64.slice(0, 32)}...(${b64.length} chars)`,
      });

      const res = await axios.post(URL, { description: payload });

      console.log("Response", res.status, res.data);
      setMsg(`${res.data.message || JSON.stringify(res.data)}`);
      toastr.success('Sucesso', 'Nota fiscal cadastrada com sucesso.');
      onUpload(res.data);
    } catch (err) {
      console.error("Upload error:", err);
      setMsg(
        err?.response?.data?.message ||
        err?.response?.data ||
        err?.message ||
        "Upload failed"
      );
    } finally {
      setBusy(false);
    }
  }

  return (
    <div style={{ maxWidth: 520, padding: 16 }}>
      <label htmlFor="file-upload" style={{ display: "block", marginBottom: 8 }}>
        SELECIONE UM ARQUIVO DE NOTA FISCAL (PDF, JPG, PNG, etc.):
      </label>
      <input id="file-upload" ref={inputRef} type="file" onChange={handleUpload} />
      <div style={{ marginTop: 10, fontSize: 12, whiteSpace: "pre-wrap" }}>{msg}</div>
    </div>
  );
}
