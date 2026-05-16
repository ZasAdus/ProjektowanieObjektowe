package main

import (
	"encoding/json"
	"io"
	"net/http"

	"github.com/labstack/echo/v4"
)

func main() {
	e := echo.New()
	e.GET("/api/weather", getWeather)
	e.Logger.Fatal(e.Start(":8080"))
}

const imgwURL = "https://danepubliczne.imgw.pl/api/data/synop/station/krakow"

type WeatherData struct {
	IdStacji           string `json:"id_stacji"`
	Stacja             string `json:"stacja"`
	DataPomiaru        string `json:"data_pomiaru"`
	GodzinaPomiaru     string `json:"godzina_pomiaru"`
	Temperatura        string `json:"temperatura"`
	PredkoscWiatru     string `json:"predkosc_wiatru"`
	KierunekWiatru     string `json:"kierunek_wiatru"`
	WilgotnoscWzgledna string `json:"wilgotnosc_wzgledna"`
	SumaOpadu          string `json:"suma_opadu"`
	Cisnienie          string `json:"cisnienie"`
}

func getWeather(c echo.Context) error {
	resp, err := http.Get(imgwURL)
	if err != nil {
		return c.JSON(http.StatusBadGateway, map[string]string{"error": "Nie udało się pobrać danych z IMGW"})
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, map[string]string{"error": "Nie udało się odczytać odpowiedzi"})
	}

	var station WeatherData

	if err := json.Unmarshal(body, &station); err != nil {
		return c.JSON(http.StatusInternalServerError, map[string]string{"error": "Nie udało się przetworzyć odpowiedzi"})
	}

	return c.JSON(http.StatusOK, WeatherData{
		IdStacji:           station.IdStacji,
		Stacja:             station.Stacja,
		DataPomiaru:        station.DataPomiaru,
		GodzinaPomiaru:     station.GodzinaPomiaru,
		Temperatura:        station.Temperatura,
		PredkoscWiatru:     station.PredkoscWiatru,
		KierunekWiatru:     station.KierunekWiatru,
		WilgotnoscWzgledna: station.WilgotnoscWzgledna,
		SumaOpadu:          station.SumaOpadu,
		Cisnienie:          station.Cisnienie,
	})
}
