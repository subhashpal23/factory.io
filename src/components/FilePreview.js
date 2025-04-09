import React from "react";
import { Image } from "antd";

const FilePreview = ({ filePath, fileRootPath }) => {
  // Ensure filePath is valid and a string
  if (!filePath || typeof filePath !== "string" || filePath === "/") return <>NA</>;

  // Normalize the file path (fixes backslashes & multiple slashes)
  const normalizedPath = `${fileRootPath}${filePath.replace(/\\/g, "/")}`;
  
  // Detect if it's an image based on extension
  const isImage = /\.(jpg|jpeg|png|gif|bmp|svg|webp|avif)$/i.test(filePath);

  // Extract file name and decode special characters (handles spaces like in "download (3).jpg")
  const fileName = decodeURIComponent(filePath.split("/").pop());

  return (
    <div>
      <a rel="noreferrer">
        {isImage ? (
          <Image width={100} src={normalizedPath} alt={fileName} />
        ) : (
          <span>{fileName}</span>
        )}
      </a>

      {/* Download button for non-image files */}
      {!isImage && (
        <a
          href={normalizedPath}
          download={fileName}
          style={{
            marginLeft: "10px",
            padding: "5px 10px",
            background: "#007bff",
            color: "#fff",
            borderRadius: "5px",
            textDecoration: "none",
            display: "inline-block",
          }}
        >
          View
        </a>
      )}
    </div>
  );
};

export default FilePreview;
