# Local Daikin Integration
This is a full integration for Daikin air conditioners using local network access. It includes UI-based setup and supports climate control, switches, selects, and sensors.
Built quick and dirty as a bridge until we have a better solution available, this custom integration allows you to connect Daikin air conditioners, specifically those running firmware version 2.8.0, to Home Assistant. It serves as a temporary solution to ensure compatibility until the official Home Assistant team can address the issue.

## 🔧 Installation

1. Copy the `local_daikin` folder into your Home Assistant `custom_components` directory:
   ```
   <config>/custom_components/local_daikin/
   ```

2. Restart Home Assistant.

3. Go to:
   **Settings → Devices & Services → Add Integration → Local Daikin**

4. Enter the IP address of your Daikin air conditioner.

## Features

- Full climate control (temperature, HVAC mode, fan, swing)
- Extra entities:
  - Switches: Power, Quiet Fan, Swing Mode
  - Select: HVAC Mode Fan Speed, Swing Mode

  - Sensors: Outdoor temperature, energy today, runtime today indoor temp, humidity
  - Sensor: Target temperature (Not programming only, not in UI, Null if not applicable due to HVAC Mode)

## Notes

- Ensure your Daikin unit is on the same network as Home Assistant.
- Communicates with the `/dsiot/multireq` endpoint on your device.


# Compatibility
This integration adds a breaking change with [Apocs182/local_daikin](https://github.com/Apoc182/local_daikin)
by adding support for firmware version `3.6.0-g4`, by updating calls
to the api from PUT to POST. In the future I might add it back

Compatibility with other models or firmware versions is not guaranteed.

# Feedback and Contributions
This integration is a quick and dirty fix, and any suggestions for improvements or expansions are welcome. If you encounter issues or have ideas for enhancements, please open an issue in the GitHub repository for this project.

# Disclaimer
This integration is not officially supported by Home Assistant or Daikin. Use it at your own risk. The creators of this integration are not responsible for any issues that may arise from its use.
This README template should help users understand how to install, configure, and use the integration, as well as set the right expectations regarding its temporary nature and supported models. If there are any other specifics or additional sections you'd like to include, feel free to let me know!

# Local Development

First create a python virtual environment, this is recommended but not required.

```shell
mkvirtualenv local_daikin
workon local_daikin
```

Install home assistant dependencies

```shell
pip install homeassistant
```

### Testing locally

If you want to test this integration locally I'd recommend using a local docker image.
Run the ./scripts/docker-run.sh, this will automatically mount this custom component to the
custom components folder of the docker container.

Add this code the `config/configuration.yaml` file to enable debug logging for this component.

```yaml
logger:
  default: info
  logs:
    custom_components.local_daikin.climate: debug
```

You can either execute a bash terminal in the container using

```shell
docker exec -i -t homeassistant bash
```

Or create a local `config/configuration.yaml` and mount it to the `config` folder in the docker
container