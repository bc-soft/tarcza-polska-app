import "package:dio/dio.dart";
import "package:retrofit/retrofit.dart";

import "package:tarcza_polska/data/remote/api/export.dart";
import "package:tarcza_polska/data/remote/dto/dtos.dart";

part "citizen_api.g.dart";

/// Ręczny interfejs Retrofit z typowanymi odpowiedziami.
///
/// Wygenerowany klient (`lib/data/remote/api/`, `swagger_parser`) zwraca `void`
/// dla endpointów bez schematu odpowiedzi w `openapi.json`. Do czasu uzupełnienia
/// spec używamy wygenerowanych modeli requestów i `DevicesClient` (rejestracja),
/// a tutaj deklarujemy te same ścieżki z ręcznymi DTO (`docs/05`, „Luki w spec”).
@RestApi()
abstract class CitizenApi {
  factory CitizenApi(Dio dio, {String? baseUrl}) = _CitizenApi;

  @GET("/api/v1/devices/me")
  Future<DeviceProfileDto> getDeviceMe();

  @PUT("/api/v1/devices/me/location")
  Future<LocationUpdateDto> putDeviceLocation(@Body() UpdateLocationRequest body);

  @PUT("/api/v1/devices/me/push-token")
  Future<void> putDevicePushToken(@Body() UpdatePushTokenRequest body);

  @GET("/api/v1/map")
  Future<FeatureCollectionDto> getMap(@Query("bbox") String bbox);

  @GET("/api/v1/incidents")
  Future<List<IncidentDto>> getIncidents({
    @Query("lat") double? lat,
    @Query("lng") double? lng,
  });

  @GET("/api/v1/incidents/{id}")
  Future<IncidentDto> getIncident(@Path("id") String id);

  @GET("/api/v1/reports/types")
  Future<List<ReportTypeDto>> getReportTypes();

  @POST("/api/v1/reports")
  Future<ReportReceiptDto> createReport(@Body() CreateReportRequest body);

  @GET("/api/v1/reports/{id}")
  Future<ReportStatusDto> getReport(@Path("id") String id);

  @GET("/api/v1/verifications/pending")
  Future<List<VerificationQuestionDto>> getPendingVerifications();

  @GET("/api/v1/verifications/{id}")
  Future<VerificationQuestionDto> getVerification(@Path("id") String id);

  @POST("/api/v1/verifications/{id}/response")
  Future<VerificationResultDto> respond(@Path("id") String id, @Body() RespondRequest body);

  @GET("/api/v1/shelters")
  Future<List<ShelterDto>> getShelters({
    @Query("bbox") String? bbox,
    @Query("lat") double? lat,
    @Query("lng") double? lng,
  });

  @GET("/api/v1/shelters/{id}")
  Future<ShelterDto> getShelter(@Path("id") String id);

  @POST("/api/v1/shelters/{id}/status")
  Future<ShelterDto> confirmShelter(
    @Path("id") String id,
    @Body() ConfirmShelterStatusRequest body,
  );

  @GET("/api/v1/alerts")
  Future<List<AlertDto>> getAlerts({@Query("lat") double? lat, @Query("lng") double? lng});

  @GET("/api/v1/alerts/{id}")
  Future<AlertDto> getAlert(@Path("id") String id);
}
