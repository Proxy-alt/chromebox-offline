# Offline MrChromebox Firmware Script

## What is this?

An **offline-compatible payload version** of the official [MrChromebox firmware script](https://github.com/MrChromebox/scripts), ideal for use in recovery toolkits, USB-based modding tools, and non-networked environments.

---

## Why use it as a payload?

This repo makes it easy to:
- Include the MrChromebox script in **flashing utilities** and **firmware recovery payloads**
- Operate in **air-gapped** setups or restricted environments with no internet access
- Ensure you’re deploying **up-to-date firmware tooling** even when offline

---

## How does it work?

This repo uses **GitHub Actions** to:
- Check for updates to [MrChromebox/scripts](https://github.com/MrChromebox/scripts) daily
- Mirror and store the latest version
- Preserve an offline-modifiable format suitable for embedded payload use

The source was adapted with help from [proxy-alt](https://github.com/proxy-alt) to support **offline script execution**.

---

## Credits

- Script authored and maintained by [MrChromebox](https://github.com/MrChromebox)
- Offline adaptation and automation powered by [proxy-alt](https://github.com/proxy-alt)

---

## Disclaimer

This project is not affiliated with or endorsed by MrChromebox. Use at your own risk.  
For the latest official version, visit: [github.com/MrChromebox/scripts](https://github.com/MrChromebox/scripts)
