# Hytale Docker Server – First-Time Setup Guide

This guide walks you through the **complete first-time setup** of the Hytale server using Docker. This was tested and used on a Linux machine,
so you may run into issues with Docker on Windows on the final step.

---

## 1. Download the Official Hytale Downloader

Download the official Hytale downloader from the Hytale support page:

> **Link:** *([Hytale Downloader](https://downloader.hytale.com/hytale-downloader.zip))*

Once downloaded, extract it.

---

## 2. Replace the Downloader Binary

Replace the placeholder file named:

```
downloader-goes-here
```

with the actual Hytale downloader program. The one you use is whatever operating system you are using.

---

## 3. Download Required Files Using the Hytale Downloader

Run the following command:

```bash
docker compose --profile update run --rm downloader
```

### What this does:
* Downloads all required Hytale server files
* Extracts them locally
* Deletes the downloader container when finished

---

### First-Time Authentication Required

On the first run, authentication is required.

View the downloader logs:

```bash
docker logs hytale-downloader
```

Look for the authentication step in the logs. It will give you a **URL and code**.

1. Open the URL
2. Enter the code
3. Complete the login

This only needs to be done **once**. Your authentication info will be saved locally.

---

## 4. Start the Server

Run:

```bash
docker compose up -d
```

This launches the server container.

---

## 5. Authenticate the Server (Required)

The server itself must also be authenticated — otherwise nobody (including you) will be able to join.

Attach to the server console:

```bash
docker attach hytale-server
```

Then run:

```
/auth login device
```

Follow the on-screen instructions.

---

## 6. Enable Persistent Authentication (IMPORTANT)

By default, credentials are stored in memory only. This means they are lost on restart.

To fix this, run:

```
/auth persistence Encrypted
```

This enables encrypted, persistent authentication storage.

---

## ⚠️ Troubleshooting: Hardware UUID Error

If you receive an error while running:

```
/auth persistence Encrypted
```

This usually means Hytale is unable to find your **hardware UUID**.

Hytale uses this identifier for encryption. If it cannot find it, it cannot encrypt the credential store.

### What this means
You will need to:
* Research where your system exposes its hardware UUID
* Bind-mount that file into the container
* Update `docker-compose.yml` accordingly

This varies by operating system.

---

## Done!

Your Hytale server will be running on the port 5520. Make sure you port forward to this port.

Whenever you want to update your server, just run:
```bash
docker compose --profile update run --rm downloader
```
then restart your server.

---

If you need help, open an issue on the repository.

