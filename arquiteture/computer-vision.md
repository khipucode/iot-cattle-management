# 🐄 Computer Vision Subsystem – Cattle Monitoring Platform

## 🎯 Objective
Design and implement a **computer vision subsystem** capable of extracting visual metrics and events from cattle environments (pasture, corral, feeding area) and sending them in near real-time to a **central IoT platform** using **MQTT**, where the data will be stored in **MariaDB** and visualized in **Grafana**.

---

## 🧱 System Architecture Overview

- 📷 **IP Camera (RTSP/ONVIF)** – provides live video stream  
- 🧠 **NVIDIA Jetson (Edge AI)** – performs real-time detection and analytics  
- 📡 **MQTT Broker (Mosquitto)** – message transport  
- 🗄️ **MariaDB** – data persistence  
- 📊 **Grafana** – dashboards and alerts

---

## ⚙️ Subsystem Functions

### 1️⃣ Cattle Counting (ROI-based)
- Count cattle inside a defined **Region of Interest (ROI)**.
- Useful for monitoring herd size, feeding behavior, and occupancy.

**Output:**  
`cattle_count` (integer)

---

### 2️⃣ Anomaly / Intrusion Detection
Detect unexpected objects in the scene:

- 👤 Person  
- 🚗 Vehicle  
- 🐕 Dog or other animals  
- ⚙️ Configurable object classes

**Output:**  
`anomaly_detected` (boolean)  
Optional: `anomaly_classes` (list/string)

---

### 3️⃣ Boundary / Geofence Violation
Detect if cattle cross predefined spatial boundaries:

- Leaving pasture area  
- Entering restricted zones  
- Crossing safety lines

**Output:**  
`boundary_violation` (boolean)  
Optional: `cattle_outside_count` (integer)

---

### 4️⃣ Motion Pattern Analysis (Optional – Future)
Detect abnormal activity:

- 🟢 Low movement  
- 🟡 Normal  
- 🔴 High agitation or stampede

**Optional Output:**  
`activity_level` (`low | normal | high`)

---

## 🧠 Edge Computing Strategy

All processing is performed **locally on the Jetson device**:

- YOLO-based object detection  
- Spatial filtering (ROI + geofence)  
- Event logic (anomaly + boundary)  
- Temporal aggregation (e.g., every 5 seconds)

✅ Benefits:

- Low latency  
- Reduced bandwidth usage  
- Works offline  
- Scalable

> A single unified service/script is recommended for detection + analytics + MQTT publishing.

---

## 📦 Data Model (MQTT Payload – JSON)

All metrics are sent in **one message** to a **single topic**.

### Required Fields

- `site_id` – Unique location identifier  
- `site_name` – Human-readable location name  
- `cattle_count` – Number of cattle detected  
- `anomaly_detected` – true / false  
- `boundary_violation` – true / false  
- `timestamp` – ISO 8601 UTC format  

### Recommended Metadata

- `camera_id`  
- `frame_window_s` (aggregation window)  
- `model_version`  
- `confidence_avg`

---

## 📡 MQTT Communication

### Topic

