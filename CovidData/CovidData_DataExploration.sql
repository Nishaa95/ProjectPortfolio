select *
from PortfolioProject.dbo.CovidDeaths

order by 3,4

--select *
--from PortfolioProject.dbo.CovidVaccinations
--order by 3,4

-- Select Data that we are going to be using

select location, date,total_cases,new_cases,total_deaths,population
from PortfolioProject.dbo.CovidDeaths
where continent is not null
order by 1,2

--Looking at total cases vs Total Deaths
--shows likelihood of dying if you contract covide in your country
select location, date,total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject.dbo.CovidDeaths
--where location like 'INDIA'
where  continent is not null
order by 1,2



-- Looking at Total cases vs population
-- shows what percentage of population got covid
select location, date,population, total_cases,(total_cases/population)*100 as CovidPercentage
from PortfolioProject.dbo.CovidDeaths
where location like 'canada'
and  continent is not null
order by 1,2


-- Looking at countries with highest infection rate to population

select location,population, MAX(CAST( total_cases as int)) as highestInfrctioncount, MAX((total_cases/population))*100 as populationInfectedRate
from PortfolioProject.dbo.CovidDeaths
where continent is not null
group by location,population
order by populationInfectedRate desc


-- Countries with high death count per population
select location,population, MAX(cast( total_deaths as int)) as TotalDeathCount, MAX((total_deaths/population))*100 as DeathRate
from PortfolioProject.dbo.CovidDeaths
where continent is not null
group by location,population
order by DeathRate desc


--Breaking things by continent
--continents with highest death count

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent is not null 
Group by continent
order by TotalDeathCount desc

--Select location, MAX(cast(Total_deaths as int)) as TotalDeathCount
--From PortfolioProject..CovidDeaths
--Where continent is  null 
--Group by location
--order by TotalDeathCount desc


--Global numbers

select sum(new_cases) as total_cases , sum(cast(new_deaths as int)) as total_deaths,sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from PortfolioProject.dbo.CovidDeaths
--where location like 'INDIA'
where  continent is not null
--group by date
order by 1,2


-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine

select death.continent, death.location, death.date, death.population, vac.new_vaccinations,
	SUM(convert(int,vac.new_vaccinations)) over (partition by death.location order by death.location,death.date  ) as RollingPeopleVaccinated
	--, (RollingPeopleVaccinated/population)*100
from PortfolioProject.dbo.CovidDeaths death
join PortfolioProject.dbo.CovidVaccinations vac
	on death.location = vac.location
	and death.date= vac.date
where death.continent is not null
order by 2,3

-- Using CTE to perform Calculation on Partition By in previous query

with PopvsVac( Continent, location, date, population,new_vaccinations, RollingPeopleVaccinated)
as
(
select death.continent, death.location, death.date, death.population, vac.new_vaccinations,
	SUM(convert(int,vac.new_vaccinations)) over (partition by death.location order by death.location,death.date  ) as RollingPeopleVaccinated
	--, (RollingPeopleVaccinated/population)*100
from PortfolioProject.dbo.CovidDeaths death
join PortfolioProject.dbo.CovidVaccinations vac
	on death.location = vac.location
	and death.date= vac.date
where death.continent is not null
--and death.location = 'India'
 --order by 2,3
)
Select * ,(RollingPeopleVaccinated/population)*100
from PopvsVac


-- Using Temp Table to perform Calculation on Partition By in previous query

DROP Table if exists #PercentPopluationVaccinated
Create Table #PercentPopluationVaccinated
(
continent nvarchar(255),
location nvarchar(255),
Date datetime,
Population numeric,
New_Vaccinations numeric,
RollingPeopleVaccinated numeric
)

Insert into #PercentPopluationVaccinated
select death.continent, death.location, death.date, death.population, vac.new_vaccinations,
	SUM(convert(int,vac.new_vaccinations)) over (partition by death.location order by death.location,death.date  ) as RollingPeopleVaccinated
	--, (RollingPeopleVaccinated/population)*100
from PortfolioProject.dbo.CovidDeaths death
join PortfolioProject.dbo.CovidVaccinations vac
	on death.location = vac.location
	and death.date= vac.date
where death.continent is not null
--and death.location = 'India'
 --order by 2,3

 Select * ,(RollingPeopleVaccinated/population)*100 as VaccinationRate

from #PercentPopluationVaccinated
--where location = 'India'


----CREATING TABLES FOR VISUALIZATION


-- Creating View to store data for later visualizations
DROP view  if exists PercentPopluationVaccinated
Create View PercentPopluationVaccinated as
select death.continent, death.location, death.date, death.population, vac.new_vaccinations,
	SUM(convert(int,vac.new_vaccinations)) over (partition by death.location order by death.location,death.date  ) as RollingPeopleVaccinated
	--, (RollingPeopleVaccinated/population)*100
from PortfolioProject.dbo.CovidDeaths death
join PortfolioProject.dbo.CovidVaccinations vac
	on death.location = vac.location
	and death.date= vac.date
where death.continent is not null
--and death.location = 'India'
 --order by 2,3

 select *
 from DeathPercent

 Create View DeathPercent as
 select sum(new_cases) as total_cases , sum(cast(new_deaths as int)) as total_deaths,sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from PortfolioProject.dbo.CovidDeaths
--where location like 'INDIA'
where  continent is not null

Create View CovidRatebyCountry as
Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
Group by Location, Population



Create View TotalDeathCount as
Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location

Create View PercentPopulationInfected as
Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
Group by Location, Population, date

